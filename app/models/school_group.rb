class SchoolGroup < ActiveRecord::Base

  has_paper_trail :class_name => 'SchoolGroupVersion', :meta => {:item_ids => :collect_item_ids}

  MAX_LEVEL = 100

  belongs_to :school

  has_many :items, :class_name => 'SchoolGroupItem', :foreign_key => :parent_id, :dependent => :destroy

  include GroupContainer


  has_many :teaches, :class_name => "Teaches"
  has_many :teachers, :through => :teaches


  validate :parenting_validation

  def items=(*args)
    self.paper_trail_event = "items_change"
    @changed_attributes['updated_at'] = self.updated_at = current_time_from_proper_timezone
    super
  end

  def people=(*args)
    self.paper_trail_event = "people_change"
    @changed_attributes['updated_at'] = self.updated_at = current_time_from_proper_timezone
    super
  end

  def groups=(*args)
    self.paper_trail_event = "groups_change"
    @changed_attributes['updated_at'] = self.updated_at = current_time_from_proper_timezone
    super
  end

  def touch(*args)
    @changed_attributes['updated_at'] = self.updated_at = current_time_from_proper_timezone
    self.save
    #super
  end

  def collect_item_ids
    self.item_ids.to_yaml
  end

  def self.undelete(school_group_id)
    SchoolGroupVersion.where(:item_id => school_group_id).last.reify
  end

  def at_time(time)


    old_version = SchoolGroupVersion.
        where(:item_id => self.id).
        where(SchoolGroupVersion.arel_table[:created_at].lteq(time)).
        last

    #If reify returns nil, group created and never modified (live)
    if old_version.event == 'create' && old_version.next
      old_group = old_version.next.reify
    else
      old_group = old_version.reify || self
    end


    item_ids = YAML.load(old_version.item_ids)

    old_group_items = []
    item_ids.each do |item_id|

      last_group_change = SchoolGroupItemVersion.where(:parent_id => self.id)
      .where(:item_id => item_id)
      .where(SchoolGroupItemVersion.arel_table[:created_at].lteq(time)).
          last

      unless last_group_change.reify
        live_group_item = SchoolGroupItem.find_by_id(item_id)
        unless live_group_item
          last_group_change = last_group_change.next
        end
      end

      old_group_items << (live_group_item || last_group_change.reify)
    end

    old_group.items = old_group_items

    old_group
  end

  def to_s
    self.name
  end


  def multi_level_parenting
    return unless self.root_parent?

    group_ids = self.items.pluck(:group_id).compact
    level = 1
    SchoolGroup::MAX_LEVEL.times do
      group_ids = SchoolGroupItem.where(:parent_id => group_ids).pluck(:group_id).compact
      level += 1 unless group_ids.empty?
    end

    self.errors.add(:groups, :multi_level_parenting) if level >= SchoolGroup::MAX_LEVEL
  end

  def root_parent?
    not SchoolGroupItem.exists?(:group_id => self)
  end


  def parenting_validation
    self.self_parenting
    self.multi_level_parenting
  end

  def self_parenting
    group_ids = self.items.pluck(:group_id).compact

    self.errors.add(:groups, :self_parenting) if group_ids.include? self.id

    while group_ids.any?
      group_ids = SchoolGroupItem.where(:parent_id => group_ids).pluck(:group_id).compact
      self.errors.add(:groups, :self_parenting) if group_ids.include? self.id
      group_ids.delete(self.id)
    end
  end
end
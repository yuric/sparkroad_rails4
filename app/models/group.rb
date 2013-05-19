class Group < ActiveRecord::Base

  MAX_LEVEL = 100

  belongs_to :school

  has_many :items, :class_name => 'GroupItem', :foreign_key => :parent_id
  include GroupContainer


  has_many :teaches, :class_name => "Teaches"
  has_many :teachers, :through => :teaches


  validate :parenting_validation

  def to_s
    self.name
  end


  def multi_level_parenting
    return unless self.root_parent?

    group_ids = self.items.pluck(:group_id).compact
    level = 1
    Group::MAX_LEVEL.times do
      group_ids = GroupItem.where(:parent_id => group_ids).pluck(:group_id).compact
      level += 1 unless group_ids.empty?
    end

    self.errors.add(:groups, :multi_level_parenting) if level >= Group::MAX_LEVEL
  end

  def root_parent?
    not GroupItem.exists?(:group_id => self)
  end


  def parenting_validation
    self.self_parenting
    self.multi_level_parenting
  end

  def self_parenting
    group_ids = self.items.pluck(:group_id).compact

    self.errors.add(:groups, :self_parenting) if group_ids.include? self.id

    while group_ids.any?
      group_ids = GroupItem.where(:parent_id => group_ids).pluck(:group_id).compact
      self.errors.add(:groups, :self_parenting) if group_ids.include? self.id
      group_ids.delete(self.id)
    end
  end
end
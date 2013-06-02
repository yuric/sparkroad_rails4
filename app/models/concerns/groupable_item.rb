module GroupableItem
  extend ActiveSupport::Concern

  included do
    belongs_to :group, :class_name => 'SchoolGroup'
    belongs_to :person

    validate :group_or_person
    private
    def group_or_person
      self.errors.add(:group, :only_one_item) unless (group && !person) || (!group && person)
    end
  end
end
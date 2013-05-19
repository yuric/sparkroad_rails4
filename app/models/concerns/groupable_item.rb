module GroupableItem
  extend ActiveSupport::Concern

  included do
    belongs_to :group
    belongs_to :student

    validate :group_or_student
    private
    def group_or_student
      self.errors.add(:group, :only_one_item) unless (group && !student) || (!group && student)
    end
  end
end
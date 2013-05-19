module GroupContainer
  extend ActiveSupport::Concern

  included do
    has_many :students, :through => :items
    has_many :groups, :through => :items
  end

  def groupables
    students + groups
  end
end
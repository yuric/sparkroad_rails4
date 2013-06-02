module GroupContainer
  extend ActiveSupport::Concern

  included do
    has_many :people, :through => :items
    has_many :groups, :through => :items
  end

  def groupables
    people + groups
  end
end
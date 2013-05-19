class BroadcastMedium < ActiveRecord::Base

  has_many :broadcast_messages

  has_paper_trail

  validates :name, :presence => true
  validates :description, :presence => true
end

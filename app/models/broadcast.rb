class Broadcast < ActiveRecord::Base
  belongs_to :school

  has_many :messages, class_name: 'BroadcastMessage'
  has_many :media, class_name: 'BroadcastMedium', through: :messages

  has_paper_trail
end

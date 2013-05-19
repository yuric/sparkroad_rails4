class BroadcastMedium < ActiveRecord::Base

  has_many :broadcast_messages

  has_paper_trail
end

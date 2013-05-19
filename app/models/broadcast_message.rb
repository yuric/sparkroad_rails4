class BroadcastMessage < ActiveRecord::Base
  belongs_to :broadcast
  belongs_to :media, class_name: 'BroadcastMedium', foreign_key: 'broadcast_media_id'

  has_paper_trail
end

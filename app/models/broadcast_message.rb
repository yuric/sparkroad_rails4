class BroadcastMessage < ActiveRecord::Base
  belongs_to :broadcast
  belongs_to :media, class_name: 'BroadcastMedium', foreign_key: 'broadcast_media_id'

  has_paper_trail

  validate :media_or_all_media
  validate :at_least_one_message

  private
  def at_least_one_message
    self.errors.add(:media, :at_least_one_message) if (english_message.to_s + spanish_message.to_s).size.zero?
  end

  def media_or_all_media
    self.errors.add(:media, :at_least_one_media) unless (all_media? && ! media) || (!all_media? && media)
  end
end

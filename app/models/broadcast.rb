class Broadcast < ActiveRecord::Base
  belongs_to :school

  has_many :items, :class_name => "BroadcastItem"
  include GroupContainer

  has_many :messages, class_name: 'BroadcastMessage'
  has_many :media, class_name: 'BroadcastMedium', through: :messages

  has_paper_trail

  validates :title, :presence => true
  validates :messages, :presence => true

  validate :duplicated_media_types
  validate :missing_media_types

  private
  def duplicated_media_types
    media_types = self.messages.collect &:broadcast_media_id
    self.errors.add(:messages, :duplicated_media) if media_types.size.nonzero? && media_types.size != media_types.uniq.size
  end

  def missing_media_types
    all_media_message = self.messages.find &:all_media
    return true if all_media_message && self.messages.size == 1
    self.errors.add(:messages, :missing_media) if !all_media_message && (self.messages.size != BroadcastMedium.count)
  end

end

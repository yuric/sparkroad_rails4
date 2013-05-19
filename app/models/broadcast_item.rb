class BroadcastItem < ActiveRecord::Base
  belongs_to :broadcast

  include GroupableItem
end

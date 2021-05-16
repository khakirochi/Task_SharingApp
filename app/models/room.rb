class Room < ApplicationRecord
  belongs_to :user
  
  mount_uploader :room_img, RoomImgUploader
  
  validates :room_name, presence: true
  validates :room_address, presence: true
  #validates :room_intro, presence: true
  validates :room_intro, length: {maximum: 140}
  validates :room_fee, presence: true, numericality: {greater_than: 0}
  validates :room_img, presence: true
  validates :user_id, presence: true
end

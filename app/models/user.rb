class User < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy
  
  has_secure_password
  
  mount_uploader :user_img, UserImgUploader
  
  USER_NAME_FORMAT = /\A[a-zA-Z0-9_]+\z/
  PASSWORD_FORMAT  = /\A[a-zA-Z0-9_]+\z/
  
  validates :user_name, presence: true, length: {maximum: 20}, format: {with: USER_NAME_FORMAT}
  validates :email, presence:true, uniqueness: true
  #validates :password_digest, presence: true
  validates :password, presence: true, length: {minimum: 8}, format: {with: PASSWORD_FORMAT}, if: :validate_password?
  validates :user_intro, presence: true, length: {maximum: 140}
  
  def validate_password?
    password.present? || password_confirmation.present?
  end
end

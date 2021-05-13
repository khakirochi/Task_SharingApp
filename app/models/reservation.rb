class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :total_users, presence: true, numericality: {greater_than: 0}
  validates :total_fee, presence: true
  validates :room_id, presence: true
  validates :user_id, presence: true
  
  validate :is_start_date_after_today
  validate :is_end_date_after_start
  
  private
  
  def is_start_date_after_today
    #use Date.current instead of Data.today for taking timezone into account.
    if start_date.nil? || start_date < Date.current
      errors.add(:start_date, 'は今日以降の日付を指定してください')
    end
  end

  def is_end_date_after_start
    if start_date.nil? || end_date.nil? || end_date <= start_date
      errors.add(:end_date, 'は開始日よりも後の日付を指定してください')  
    end
  end
  
end

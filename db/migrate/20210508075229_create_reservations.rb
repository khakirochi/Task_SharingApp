class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.integer :total_users
      t.integer :total_fee
      t.integer :room_id
      t.integer :user_id

      t.timestamps
    end
  end
end

class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.string :room_address
      t.text :room_intro
      t.integer :room_fee
      t.string :room_img_name
      t.integer :user_id

      t.timestamps
    end
  end
end

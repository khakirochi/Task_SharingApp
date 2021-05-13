class RenameRoomImgNameColumnToRooms < ActiveRecord::Migration[5.2]
  def change
    rename_column :rooms, :room_img_name, :room_img
  end
end

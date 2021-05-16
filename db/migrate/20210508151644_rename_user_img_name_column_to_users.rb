class RenameUserImgNameColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :user_img_name, :user_img
  end
end

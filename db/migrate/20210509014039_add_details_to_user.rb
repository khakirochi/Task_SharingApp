class AddDetailsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_intro, :text
    add_column :users, :user_img, :string
  end
end

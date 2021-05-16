class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.string :password_digest
      t.text :user_intro
      t.string :user_img_name

      t.timestamps
    end
  end
end

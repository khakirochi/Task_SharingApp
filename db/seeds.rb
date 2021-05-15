# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#User.create(user_name:"testuser1", email:"testuser1@example.com", password:"testpass1",user_intro:"testuser1です", user_img:"default_user_img.png" )
User.create(user_name:"testuser2", email:"testuser2@example.com", password:"testpass2",user_intro:"testuser2です", user_img:"default_user_img.png" )
User.create(user_name:"testuser3", email:"testuser3@example.com", password:"testpass3",user_intro:"testuser3です", user_img:"default_user_img.png" )
User.create(user_name:"testuser4", email:"testuser4@example.com", password:"testpass4",user_intro:"testuser4です", user_img:"default_user_img.png" )
User.create(user_name:"testuser5", email:"testuser5@example.com", password:"testpass5",user_intro:"testuser5です", user_img:"default_user_img.png" )

# Room.create(room_name: "テストルーム1", room_address: "東京都杉並区", room_intro: "テストルーム1です", room_fee: 1000, room_img: "default_room_img.png", user_id: 1)
Room.create(room_name: "テストルーム2", room_address: "東京都荒川区", room_intro: "テストルーム2です", room_fee: 2000, room_img: "default_room_img.png", user_id: 1)
Room.create(room_name: "テストルーム3", room_address: "大阪府大阪市", room_intro: "テストルーム3です", room_fee: 3000, room_img: "default_room_img.png", user_id: 1)
Room.create(room_name: "テストルーム4", room_address: "京都府京都市", room_intro: "テストルーム4です", room_fee: 4000, room_img: "default_room_img.png", user_id: 2)
Room.create(room_name: "テストルーム5", room_address: "北海道札幌市", room_intro: "テストルーム5です．冬は雪が降ります．", room_fee: 5000, room_img: "default_room_img.png", user_id: 2)
Room.create(room_name: "テストルーム6", room_address: "東京都杉並区", room_intro: "テストルーム6です．東京都内です",       room_fee: 6000, room_img: "default_room_img.png", user_id: 3)
Room.create(room_name: "テストルーム7", room_address: "群馬県片品村", room_intro: "雪が降ります．スキーが盛んです", room_fee: 7000, room_img: "default_room_img.png", user_id: 3)
Room.create(room_name: "テストルーム8", room_address: "兵庫県神戸市", room_intro: "イノシシが出現します", room_fee: 8000, room_img: "default_room_img.png", user_id: 4)
Room.create(room_name: "テストルーム9", room_address: "東京都多摩市", room_intro: "タヌキが出現します",   room_fee: 9000, room_img: "default_room_img.png", user_id: 5)


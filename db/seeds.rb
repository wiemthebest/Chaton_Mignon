# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#Une base de donnée vide, c'est quand même assez triste. 
#On va donc te demander de la peupler avec quelques photos de chatons qui envoient du lourd.

#Comme ça, tous ceux qui vont développer sur le site pourrons profiter de quelques items en base.

require  'faker'

Faker::Config.locale = 'fr'

Item.destroy_all
User.destroy_all
Cart.destroy_all
Order.destroy_all
OrderItem.destroy_all
CartItem.destroy_all

puts "créer 20 items..."
images_array = ["https://64.media.tumblr.com/8aca17fe8dcff29d780283bd698e21b3/tumblr_no1bkiklDH1qbjrrso1_640.jpg",
 "https://cdn.discordapp.com/attachments/850344896308969492/851465990368919632/-e6zvnsaHvn6eAaIiiTbTR7shoHBIl1M1DFdg_SKEOmgBBBy-KRXvkZbCA0OHcAi3svw5UajmXMmZSfUDZPZXpFhF-IqGPaigPtJ.png",
"https://cdn.discordapp.com/attachments/850344896308969492/851466134880124949/cOWR5n12LP4WwG5ffWg6E6SfGgrSKY0Htb8zji_aNzqaKWKhMTMLyKoaZ4b2qkggnL2NzG8gVEn_XIwbZpFyfnW6iIZUfCudl3Gu.png",
" https://cdn.discordapp.com/attachments/850344896308969492/851466345320153098/j8Aex5Om6CLBVAmah5LXDwwWJ69ci4DPYMcLNjq3I6B8yI9jFVwF5bvsWge7LUNlpZtC7BGj35IroG6N00LXjUZ6Sy5RVgxi1P5h.png",
"https://64.media.tumblr.com/dcb257f4ebfeee2c3c963d9ae00b60be/tumblr_nzo8f6ze2a1u6jismo1_640.jpg",
"https://fac.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2FFAC.2Fvar.2Ffemmeactuelle.2Fstorage.2Fimages.2Fanimaux.2Fanimaux-pratique.2Ftout-savoir-sur-poil-chat-19864.2F13133161-2-fre-FR.2Fon-vous-dit-tout-sur-les-poils-de-chat.2Ejpg/850x478/quality/90/crop-from/center/on-vous-dit-tout-sur-les-poils-de-chat.jpeg",
"https://static.actu.fr/uploads/2020/08/25405-200804150844750-0-960x640.jpg", 
"https://www.leparisien.fr/resizer/dxeKDoZ9oIMydrKE4h3nzeFb0CM=/932x582/cloudfront-eu-central-1.images.arcpublishing.com/leparisien/KIOHEM7YJBRED3P2P5FBOREIIM.jpg",

]


9.times do |i|
  item = Item.create!(title: Faker::Creature::Cat.name, description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false), price: Faker::Number.decimal(l_digits: 2), image_url: images_array[i-1])
end
puts "  Done"
puts "user a été creer"
test_user = User.create!(email: 'test@example.com', password: "password", password_confirmation: "password")
puts "  Done. Use 'test@example.com' as login and 'password' as password"
puts "admin user a été creer"
admin_user = User.create!(email: 'super_test_admin@amazing.com', password: "thatstrulyincredible", password_confirmation: "thatstrulyincredible", admin: true)
admin_cart = Cart.create!(user: admin_user)
puts "  Done"
puts "carte a été associé a un user"
test_cart = Cart.create!(user: test_user)
puts "  Done"
puts "mettre les cartes dans un user carte"
test_cart.items.push(Item.all.last)
puts "  Done"
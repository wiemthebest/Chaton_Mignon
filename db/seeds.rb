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
puts "Destroy all items..."
Item.destroy_all
puts "  Done"
puts "Destroy all users..."
User.destroy_all
puts "  Done"
puts "Destroy all carts..."
Cart.destroy_all
puts "  Done"
puts "Destroy all orders..."
Order.destroy_all
puts "  Done"
OrderItem.destroy_all
CartItem.destroy_all

puts "Create 20 items..."
images_array = ["https://64.media.tumblr.com/8aca17fe8dcff29d780283bd698e21b3/tumblr_no1bkiklDH1qbjrrso1_640.jpg",
 "https://cdn.discordapp.com/attachments/850344896308969492/851465990368919632/-e6zvnsaHvn6eAaIiiTbTR7shoHBIl1M1DFdg_SKEOmgBBBy-KRXvkZbCA0OHcAi3svw5UajmXMmZSfUDZPZXpFhF-IqGPaigPtJ.png"]
9.times do |i|
  item = Item.create!(title: Faker::Creature::Cat.name, description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false), price: Faker::Number.decimal(l_digits: 2), image_url: images_array[i-1])
end
puts "  Done"
puts "Create test user..."
test_user = User.create!(email: 'test@example.com', password: "password", password_confirmation: "password")
puts "  Done. Use 'test@example.com' as login and 'password' as password"
puts "Create test admin user..."
admin_user = User.create!(email: 'super_test_admin@amazing.com', password: "thatstrulyincredible", password_confirmation: "thatstrulyincredible", admin: true)
admin_cart = Cart.create!(user: admin_user)
puts "  Done"
puts "Create test cart associated to test_user..."
test_cart = Cart.create!(user: test_user)
puts "  Done"
puts "Push one item in test_user's cart."
test_cart.items.push(Item.all.last)
puts "  Done"
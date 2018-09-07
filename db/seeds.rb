# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
  name  = Faker::Name.name
  Category.create!(name:  name,
                parent_id: rand(0..9))

end

10.times do |n|
  name  = Faker::Name.name
  content = Faker::Lorem.sentence(5)
  Product.create!(name:  name,
               price: rand(50..10000),
               quantity: rand(5..30),
               description: content,
               picture: "default.png",
               category_id: 3)
end

User.create!(name:  "duongtruong",
             email: "duongtruong@gmail.com",
             password: "foobar",
             password_confirmation: "foobar",
             role: 1,
             address: "fdsfdsfdsfdsfdsfsdasdsad",
             phone: "3454343242"
             )

User.create!(name:  "vanle",
             email: "phamvanle@gmail.com",
             password: "123123",
             password_confirmation: "123123",
             role: 1,
             address: "quang nam",
             phone: "01667272741"
             )

10.times do |n|
  name  = Faker::Name.name
  email = "example_#{n}@gmail.com"
  password = "123123"
  content = Faker::Lorem.sentence(5)
  User.create!(name:  name,
               email: email,
               password: password,
               password_confirmation: password,
               role: 0,
               address: content,
               phone: "01667272741")
end

p "Created #{User.count} users"

10.times do |n|
  name  = Faker::Name.name
  content = Faker::Lorem.sentence(5)
  Order.create!(user_id: rand(3..12),
               receiver_name:  name,
               receiver_address: content,
               receiver_phone: "01667272741",
               total_price: rand(100..10000))

end

Category.create!(name:  "cccccccccccc",
             parent_id: 1
             )
p "Created #{Category.count} categoriess"

Suggest.create!(name:  "aaaaaaaaaaaa",
             description: "bbbbbbbbbbbbbbb",
             status: 1,
             user_id: 1,
             category_id: 1
             )
p "Created #{Suggest.count} suggets"

require 'faker'

puts "cleaning DB"
User.destroy_all
Flat.destroy_all

puts "creating 10 users"

10.times do
  email = Faker::Internet.unique.email
  User.create(email: email, password: "123456")
end

puts "creating 20 flats"

20.times do
  title = Faker::Restaurant.name
  description = Faker::Restaurant.description
  location = Faker::Address
  Flat.create(user_id: rand(1..10), title: title, location: location, description: description)
end

puts "done creating flats and users"

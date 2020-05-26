require 'faker'

puts "cleaning DB"
User.destroy_all
Flat.destroy_all

puts "creating 11 users"

User.create(email: "bob@gmail.com", password: "123456")

10.times do
  email = Faker::Internet.unique.email
  User.create(email: email, password: "123456")
end

puts "creating 20 flats"

20.times do
  title = Faker::Restaurant.name
  description = Faker::Restaurant.description
  location = ["Paris", "London", "Tour Eiffel", "Big Ben", "39 rue Armand Carrel, 75019 Paris", "75019 Paris", "Buttes Chaumont", "Louvre Paris", "75010 Paris", "75005 Paris", "75001 Paris", "75020 Paris", "Buckingham Palace", "Tower Bridge", "The British Museum"].sample
  Flat.create(user_id: rand(1..10), title: title, location: location, description: description)
end

puts "done creating flats and users"

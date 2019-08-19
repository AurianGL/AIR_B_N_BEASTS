# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroy uses"

User.destroy_all

puts "seed users"

10.times do
  User.create(
      first_name: Faker::Movies::HarryPotter.character,
      last_name: Faker::Movies::HarryPotter.spell,
      email: Faker::Internet.email,
      phone_number: Faker::PhoneNumber.phone_number,
      password: "password",
    )
end

puts "users created"




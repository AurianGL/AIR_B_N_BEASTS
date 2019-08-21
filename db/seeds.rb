puts "destroy users"

User.destroy_all

puts "Creating 11 fake users..."

User.create(
      first_name: "Harry Potter",
      last_name: Faker::Movies::HarryPotter.spell,
      email: Faker::Internet.email,
      phone_number: Faker::PhoneNumber.phone_number,
      password: "password",
    )

10.times do
  User.create(
      first_name: Faker::Movies::HarryPotter.character,
      last_name: Faker::Movies::HarryPotter.spell,
      email: Faker::Internet.email,
      phone_number: Faker::PhoneNumber.phone_number,
      password: "password",
    )
end

puts "10 fake users created ⭐️"

species = ["Owl", "Elf", "Basilisk", "Hungarian Horntail", "Fawke", "Dementor", "Goblin", "Troll", "Cerberus"]


users = User.all

puts "destroy beasts"

Beast.destroy_all

puts "Creating fake beasts..."

beasts_names = ["Hedwig", "Fang", "Crookshanks", "Pigwidgeon", "Errol", "Nagini", "The Hungarian Horntail", " Fluffy the Three-Headed Dog ", "Fawkes", "Aragog", "Slytherin's Basilisk "]

users.each do |user|
  rand(3..6).times do
    Beast.create!(
      name: beasts_names.sample,
      description: Faker::Movies::HarryPotter.house,
      address: Faker::Movies::HarryPotter.location,
      dangerosity: rand(1..5),
      price: rand(1..50),
      species: species.sample,
      user_id: user.id
  )
  end
end

puts "fake beasts created 🐲"

Booking.destroy_all

puts "Creating fake bookings..."

beasts = Beast.all
user_ids = users.map do |user|
    user.id
  end

beasts.each do |beast|
  Booking.create!(
  start_date: Date.parse('20191012'),
  end_date: Date.parse('20191112'),
  status: true,
  beast_id: beast.id,
  user_id: user_ids.sample
  )
  Booking.create!(
  start_date: Date.parse('20201012'),
  end_date: Date.parse('20201112'),
  status: false,
  beast_id: beast.id,
  user_id: user_ids.sample
  )
end

puts "Created fake bookings... 🐿"

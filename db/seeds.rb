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


# species_image = {
#   "Owl" => image_url('app/assets/images/Owl.jpg'),
#   "Elf" => image_url('app/assets/images/Elf.png'),
#   "Basilisk" => image_url('app/assets/images/Basilisk.jpg'),
#   "Hungarian Horntail" => image_url('app/assets/images/hungarianhorntail.jpg'),
#   "Fawke" => image_url('app/assets/images/Fawkes.jgg'),
#   "Dementor" => image_url('app/assets/images/dementor.jpg'),
#   "Goblin" => image_url('app/assets/images/Goblin.jpg'),
#   "Troll" => image_url('app/assets/images/Troll.jpg'),
#   "Cerberus" => image_url('app/assets/images/Cerberus.jpg')
# }

=======

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
  start_date: Date.parse('20191012'),
  end_date: Date.parse('20191112'),
  status: false,
  beast_id: beast.id,
  user_id: user_ids.sample
  )
end

puts "Created fake bookings... 🐿"

puts "destroy users"

User.destroy_all

puts "Creating 3 fake users..."

User.create(
      first_name: "Harry Potter",
      last_name: Faker::Movies::HarryPotter.spell,
      email: Faker::Internet.email,
      phone_number: Faker::PhoneNumber.phone_number,
      password: "password",
    )

User.create(
      first_name: "Hermione Granger",
      last_name: Faker::Movies::HarryPotter.spell,
      email: Faker::Internet.email,
      phone_number: Faker::PhoneNumber.phone_number,
      password: "password",
    )

User.create(
      first_name: "Ron Weasley",
      last_name: Faker::Movies::HarryPotter.spell,
      email: Faker::Internet.email,
      phone_number: Faker::PhoneNumber.phone_number,
      password: "password",
    )


puts "3 fake users created ⭐️"

species = ["Owl", "Elf", "Basilisk", "Hungarian Horntail", "Fawke", "Dementor", "Goblin", "Troll", "Cerberus"]


users = User.all

puts "destroy beasts"

Beast.destroy_all

puts "Creating 4 dragons..."



    Beast.create!(
      name: "Ommadon",
      description: Faker::Movies::HarryPotter.house,
      address: Faker::Movies::HarryPotter.location,
      dangerosity: rand(1..5),
      price: rand(15..150),
      species: "Aragh",
      user_id: User.first.id,
      promo: 50,
  )

     Beast.create!(
      name: "Carolinus",
      description: Faker::Movies::HarryPotter.house,
      address: Faker::Movies::HarryPotter.location,
      dangerosity: rand(1..5),
      price: rand(15..150),
      species: "Smrgol",
      user_id: User.first.id,
      promo: 50,
  )

      Beast.create!(
      name: "Orrin Neville-Smythe",
      description: Faker::Movies::HarryPotter.house,
      address: Faker::Movies::HarryPotter.location,
      dangerosity: rand(1..5),
      price: rand(15..150),
      species: "Bryagh",
      user_id: User.last.id,
      promo: 50,
  )

       Beast.create!(
      name: "Solarius",
      description: Faker::Movies::HarryPotter.house,
      address: Faker::Movies::HarryPotter.location,
      dangerosity: rand(1..5),
      price: rand(15..150),
      species: "Gorbash",
      user_id: User.last.id,
      promo: 50,
  )





puts "Creating fake beasts..."

beasts_names = ["Hedwig", "Fang", "Crookshanks", "Pigwidgeon", "Errol", "Nagini", " Fluffy the Three-Headed Dog ", "Aragog", "Slytherin"]



users.each do |user|
  rand(1..3).times do
    Beast.create!(
      name: beasts_names.sample,
      description: Faker::Movies::HarryPotter.house,
      address: Faker::Movies::HarryPotter.location,
      dangerosity: rand(1..5),
      price: rand(15..150),
      species: species.sample,
      user_id: user.id,

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

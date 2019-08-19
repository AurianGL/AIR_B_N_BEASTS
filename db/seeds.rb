puts "destroy users"

User.destroy_all

puts "Creating 10 fake users..."

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

users.each do |user|
  rand(1..2).times do
    Beast.create!(
      name: Faker::Movies::HarryPotter.character,
      description: Faker::Movies::HarryPotter.house,
      address: Faker::Movies::HarryPotter.location,
      dangerosity: rand(1..5),
      price: rand(1..50),
      species: species.sample,
      created_at: Date.parse('20191012'),
      updated_at: Date.parse('20191112'),
      photo: File.open(File.join(Rails.root, "app/assets/images/harry.jpg")),
      user_id: user.id
  )
  end
end

puts "fake beasts created 🐲"


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

puts "destroy beasts"

Beast.destroy_all

puts "Creating fake beasts..."

User.each do |user|
  (1..2).sample.times do
    Beast.create!(
      name: Faker::Movies::HarryPotter.character,
      description: Faker::Movies::HarryPotter.house,
      address: Faker::Movies::HarryPotter.location,
      dangerosity: (1..5).sample,
      price: (1..50).sample,
      species: species.sample,
      created_at: Date.parse(20191012),
      updated_at: Date.parse(20191112),
      photo: File.open(File.join(Rails.root, "app/assets/images/harry.jpg"))
  )

puts "fake beasts created 🐲"


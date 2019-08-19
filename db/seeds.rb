require 'faker'

species = ["Owl", "Elf", "Basilisk", "Hungarian Horntail", "Fawke", "Dementor", "Goblin", "Troll", "Cerberus"]

Beast.destroy_all

Puts "Creating fake beasts..."

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

puts "Creating roles..."

Role.find_or_create_by!(name: "admin")
Role.find_or_create_by!(name: "client")

puts "Roles created successfully!"

puts "Creating reading types..."

ReadingType.find_or_create_by!(name: "One-card spread")
ReadingType.find_or_create_by!(name: "Three-card spread")
ReadingType.find_or_create_by!(name: "Five-card spread")
ReadingType.find_or_create_by!(name: "Celtic Cross spread")

puts "Reading types created successfully"

puts "Creating tarot cards..."

TarotCard.create!([
  { name: "The Fool", img_link: "https://imgur.com/a/RtgT6wl", arcana_type: "Major", element: "Air", description: "" },
  { name: "The Magician", img_link: "https://imgur.com/hdos4t0", arcana_type: "Major", element: "Air", description: "" },
  { name: "The High Priestess", img_link: "https://imgur.com/FktEEoi", arcana_type: "Major", element: "Water", description: "" },
  { name: "The Empress", img_link: "https://imgur.com/7V6OsJe", arcana_type: "Major", element: "Earth", description: "" },
  { name: "The Emperor", img_link: "https://imgur.com/5UBE8In", arcana_type: "Major", element: "Fire", description: "" },
  { name: "The Hierophant", img_link: "https://example.com/hierophant.png", arcana_type: "Major", element: "Earth", description: "" },
  { name: "The Lovers", img_link: "https://imgur.com/LvwRm7e", arcana_type: "Major", element: "Air", description: "" },
  { name: "The Chariot", img_link: "https://imgur.com/LuuGfR5", arcana_type: "Major", element: "Water", description: "" },
  { name: "Strength", img_link: "https://imgur.com/ILaBBYg", arcana_type: "Major", element: "Fire", description: "" },
  { name: "The Hermit", img_link: "https://imgur.com/xl8UFcR", arcana_type: "Major", element: "Earth", description: "" },
  { name: "Wheel of Fortune", img_link: "https://imgur.com/mlUn5as", arcana_type: "Major", element: "Fire", description: "" },
  { name: "Justice", img_link: "https://imgur.com/OKmktzA", arcana_type: "Major", element: "Air", description: "" },
  { name: "The Hanged Man", img_link: "https://imgur.com/Fr4nKck", arcana_type: "Major", element: "Water", description: "" },
  { name: "Death", img_link: "https://imgur.com/AqJP2Ti", arcana_type: "Major", element: "Water", description: "" },
  { name: "Temperance", img_link: "https://imgur.com/5mQtW7Z", arcana_type: "Major", element: "Fire", description: "" },
  { name: "The Devil", img_link: "https://imgur.com/rcAVIbw", arcana_type: "Major", element: "Earth", description: "" },
  { name: "The Tower", img_link: "https://imgur.com/YxheclV", arcana_type: "Major", element: "Fire", description: "" },
  { name: "The Star", img_link: "https://imgur.com/7gyZnzG", arcana_type: "Major", element: "Air", description: "" },
  { name: "The Moon", img_link: "https://imgur.com/jkFk3sc", arcana_type: "Major", element: "Water", description: "" },
  { name: "The Sun", img_link: "https://imgur.com/aJca7hY", arcana_type: "Major", element: "Fire", description: "" },
  { name: "Judgement", img_link: "https://imgur.com/a/yqZDPXC", arcana_type: "Major", element: "Fire", description: "" },
  { name: "The World", img_link: "https://imgur.com/ZEQadsV", arcana_type: "Major", element: "Earth", description: "" }
])

puts "Tarot cards created successfully!"

puts "Creating users..."

User.find_or_create_by!(email: "caitlin@example.com") do |user|
  user.username = "Caitlin"
  user.password = "password123"
  user.role = Role.find_by(name: "admin")
end

User.find_or_create_by!(email: "seeker@example.com") do |user|
  user.username = "tarot_seeker"
  user.password = "password123"
  user.role = Role.find_by(name: "client")
end

puts "Users created successfully!"

puts "Seed data loaded successfully!"

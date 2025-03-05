Role.create!(type: "admin")
Role.create!(type: "client")

ReadingType.create!([
  { name: "One-card spread" },
  { name: "Three-card spread" },
  { name: "Five-card spread" }
  { name: "Celtic Cross spread" },
])

TarotCard.create!([
  { name: "The Fool", img_link: "https://example.com/fool.png", arcana_type: "Major", element: "Air", description: "" },
  { name: "The Magician", img_link: "https://example.com/magician.png", arcana_type: "Major", element: "Air", description: "" },
  { name: "The High Priestess", img_link: "https://example.com/highpriestess.png", arcana_type: "Major", element: "Water", description: "" },
  { name: "The Empress", img_link: "https://example.com/empress.png", arcana_type: "Major", element: "Earth", description: "" },
  { name: "The Emperor", img_link: "https://example.com/emperor.png", arcana_type: "Major", element: "Fire", description: "" },
  { name: "The Hierophant", img_link: "https://example.com/hierophant.png", arcana_type: "Major", element: "Earth", description: "" },
  { name: "The Lovers", img_link: "https://example.com/lovers.png", arcana_type: "Major", element: "Air", description: "" },
  { name: "The Chariot", img_link: "https://example.com/chariot.png", arcana_type: "Major", element: "Water", description: "" },
  { name: "Strength", img_link: "https://example.com/strength.png", arcana_type: "Major", element: "Fire", description: "" },
  { name: "The Hermit", img_link: "https://example.com/hermit.png", arcana_type: "Major", element: "Earth", description: "" },
  { name: "Wheel of Fortune", img_link: "https://example.com/wheel.png", arcana_type: "Major", element: "Fire", description: "" },
  { name: "Justice", img_link: "https://example.com/justice.png", arcana_type: "Major", element: "Air", description: "" },
  { name: "The Hanged Man", img_link: "https://example.com/hangedman.png", arcana_type: "Major", element: "Water", description: "" },
  { name: "Death", img_link: "https://example.com/death.png", arcana_type: "Major", element: "Water", description: "" },
  { name: "Temperance", img_link: "https://example.com/temperance.png", arcana_type: "Major", element: "Fire", description: "" },
  { name: "The Devil", img_link: "https://example.com/devil.png", arcana_type: "Major", element: "Earth", description: "" },
  { name: "The Tower", img_link: "https://example.com/tower.png", arcana_type: "Major", element: "Fire", description: "" },
  { name: "The Star", img_link: "https://example.com/star.png", arcana_type: "Major", element: "Air", description: "" },
  { name: "The Moon", img_link: "https://example.com/moon.png", arcana_type: "Major", element: "Water", description: "" },
  { name: "The Sun", img_link: "https://example.com/sun.png", arcana_type: "Major", element: "Fire", description: "" },
  { name: "Judgement", img_link: "https://example.com/judgement.png", arcana_type: "Major", element: "Fire", description: "" },
  { name: "The World", img_link: "https://example.com/world.png", arcana_type: "Major", element: "Earth", description: "" }
])

rank_to_description = {
  "Ace" => "A new beginning, potential, and fresh energy.",
  "Two" => "Balance, partnership, and duality.",
  "Three" => "Growth, teamwork, and expansion.",
  "Four" => "Stability, contemplation, and rest.",
  "Five" => "Conflict, loss, and challenges.",
  "Six" => "Harmony, nostalgia, and generosity.",
  "Seven" => "Choices, illusions, and opportunities.",
  "Eight" => "Movement, change, and action.",
  "Nine" => "Fulfillment, self-reliance, and satisfaction.",
  "Ten" => "Completion, legacy, and fulfillment.",
  "Page" => "Curiosity, new experiences, and learning.",
  "Knight" => "Action, ambition, and pursuit of goals.",
  "Queen" => "Maturity, intuition, and nurturing energy.",
  "King" => "Mastery, authority, and leadership."
}

rank_to_filename.each do |rank, filename|
  TarotCard.create!(
    name: "#{rank} of Cups",
    img_link: "https://yourhost.com/#{filename}_of_cups.png",
    arcana_type: "Minor",
    element: "Water",
    description: rank_to_description[rank] # Assigns the description dynamically
  )
end



User.create!(username: "Caitlin", email: "caitlin@example.com", password: "password123", role: Role.find_by(type: "admin"))

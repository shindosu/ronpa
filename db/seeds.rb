puts `Deleting Topics`
Topic.destroy_all
puts "Deleted all Topics, now creating topics..."

Topic.create!(
  proposition: "Mos Burger is more delicious than Cocoichi",
  level: 1,
  description: "Impact hub people love cocoichi, but mos burger is also the pinnacle of healthy burgers in Japan
  Fast food healthy burgers vs thicc savory curry rice, which fast food chain satisfies our bellies more?
  Ronp this once and for all!",
  category: "Food"
)

Topic.create(
  proposition: "Flavie is an obsolete language learning app",
  level: 4,
  description: "Why use flavie when you can use Ronpa?",
  category: "General"
)

Topic.create(
  proposition: "Adult cats are cuter than human babies",
  level: 2,
  description: "They are fluffy and have bigger eyes. They also don't poop and pee on themselves.",
  category: "Politics"
)

Topic.create(
  proposition: "Joker was not a good movie",
  level: 3,
  description: "Change my mind.",
  category: "Food"
)

Topic.create(
  proposition: "Fred Perry is higher quality than uniqlo",
  level: 2,
  description: "Face off between the two high quality clothing brands!
  Ronp this once and for all!",
  category: "Apparel"
)


Topic.create(
  proposition: "Spring cleaning contributes to seasonal allergies",
  level: 2,
  description: "Cleaning your house isnt all its cracked up to be.",
  category: "Food"
)


filepath = "./topic_seed_file.json"
file = File.read(filepath)
topics = JSON.parse(file)

topics["debates"]["debate"].each do |debate|
  Topic.create(
    proposition: debate["title"],
    level: rand(1..5),
    description: debate["description"],
    category: debate["topic"].capitalize
  )
end

puts "created #{Topic.count} topic(s)"

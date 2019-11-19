puts `Deleting Topics`
Topic.delete_all
puts "Deleted all Topics, now creating topics..."

Topic.create(
  proposition: "Mos Burger is better than Cocoichi",
  level: 1,
  description: "Impact hub peeps love cocoichi, but mos burger is also the pinnace of healthy burgers in Japan
  Fast food healthy burgers vs thicc savory curry rice, which fast food chain satisfies our bellies more?
  Ronp this once and for all",
  category: "Food"
)

Topic.create(
  proposition: "Abercrombie & Fitch vs Hollister",
  level: 2,
  description: "Face off between the two best American fashion brands!
  Ronp this once and for all",
  category: "Apparel"
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
require 'faker'

# USER SEEDS------------------------------

puts "attempting to make new users..."
puts "..."

num_new_users = 20

num_new_users.times do |i|
  User.create!(
      email: Faker::Internet.unique.email,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      username: Faker::Internet.unique.username,
      language_level: (0..5).to_a.sample,
      password: "secret"
    )
end

puts puts "created #{num_new_users} new users"

# TOPIC SEEDS------------------------------

puts 'Deleting Topics'
puts "..."
Topic.destroy_all
puts "Deleted all Topics, now creating topics..."

Topic.create!(
  proposition: "Mos Burger is more delicious than Cocoichi",
  level: 1,
  description: "Many people love cocoichi, but mos burger is also the pinacle of healthy burgers in Japan.
  Fast food healthy burgers vs savory curry rice, which fast food chain satisfies our bellies more?
  Ronp this once and for all!",
  category: "Food",
  user: User.all.sample
)

Topic.create(
  proposition: "Pepsi is the finest cola in the world",
  level: 4,
  description: "There may be some who feel strongly about this one. Which brand could stand up to the challenge?",
  category: "Food",
  user: User.all.sample
)

Topic.create(
  proposition: "The rise of Artificial Intelligence will be to the detriment of mankind",
  level: 2,
  description: "With millions of humans set to be made economically obsolete, should we really allow this new technology to emerge unopposed?",
  category: "General",
  user: User.all.sample
)

Topic.create(
  proposition: "Joker was not a good movie",
  level: 3,
  description: "This movie celebrated violence and validates incel behaviour. Do we really wish to give screen time to these kinds of views?",
  category: "Entertainment",
  user: User.all.sample
)

Topic.create(
  proposition: "Fred Perry is higher quality than uniqlo",
  level: 2,
  description: "Face off between the two high quality clothing brands!
  Ronp this once and for all!,",
  category: "Apparel",
  user: User.all.sample
)


Topic.create(
  proposition: "Spring cleaning contributes to seasonal allergies",
  level: 2,
  description: "Cleaning your house isnt all its cracked up to be.",
  category: "Food",
  user: User.all.sample
)

Topic.create(
  proposition: "Age is not important in choosing relationships",
  level: 3,
  description: "They say that age is just a number. Surely love should transcend this boundary too?",
  category: "general",
  user: User.all.sample
)


filepath = "./topic_seed_file.json"
file = File.read(filepath)
topics = JSON.parse(file)

topics["debates"]["debate"].each do |debate|
  Topic.create(
    proposition: debate["title"],
    level: rand(1..5),
    description: debate["description"],
    category: debate["topic"].capitalize,
    user: User.all.sample
  )
end

puts "created #{Topic.count} topic(s)"


# ARGUMENT SEEDS ------------------------------

puts "Deleting old arguments"
puts "..."
Argument.destroy_all
puts "creating new arguments"

User.all.each do |user|
  Topic.all.sample(10).each do |topic|
    3.times do |i|
      Argument.create(
        topic: topic,
        user: user,
        side: :affirmative,
        content: "An affirmative argument"
      )
    end

    3.times do |i|
      Argument.create(
        topic: topic,
        user: user,
        side: :negative,
        content: "A negative argument"
      )
    end
  end
end

puts "Done making #{Argument.count} arguments"


# DEBATE & PARTICIPANT SEEDS ----------------------------

puts "deleting participants"
puts "..."
Participant.destroy_all
puts "done deleting particiants"

puts "deleting debates"
puts "..."
Debate.destroy_all
puts "done deleting debates"
puts "creating new debates and participants"

User.all.each do |user|
  Debate.create(
    topic: user.prepared_topics.sample
  )
  new_debate = Debate.last
  Participant.create(
    user: user,
    debate: new_debate,
    role: [:affirmative, :negative, :moderator].sample
  )
end

puts "done creating #{Debate.count} debates and #{Participant.count} participants"


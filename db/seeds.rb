include RandomData

#Creates users

  unless User.find_by email:
  User.create!(

  name: "Bob Dylan",
  email: "highway61@gmail.com",
  password: "Maggies_Farm",
  role: :admin
  )
end

#Create an Admin
unless User.find_by email: "admin@example.com"
  admin = User.create!(
    name: "Admin Example",
    email: "admin@example.com",
    password: "helloworld",
    role: 'admin'
  )
end

users = User.all

puts "#{User.count} users have been persisted."

# Create Labels
%w(Sam Frodo Boromir Sauron Galandriel Bilbo Saruman Gollum Gandalf Aragorn Gimli).each do |label|
  Label.create!(name: label)
end
labels = Label.all
puts "#{Label.count} labels have been persisted."
# Creates Topics

15.times do
  t = Topic.create!(
  name: RandomData.random_sentence,
  description: RandomData.random_paragraph
  )
  if 0.5 > rand()
    t.labels = rand(1..5).times.collect { labels.sample }.uniq
    t.save!
  end
end
topics = Topic.all
puts "#{Topic.count} topics have been persisted."


# Create Posts
50.times do
  p = Post.create!(
    user:   users.sample,
    topic:  topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph,
    created_at: rand(10.minutes .. 1.year).ago
  )
  rand(1..20).times {p.votes.create!(value: [-1, 1].sample, user: users.sample)}
  if 0.5 > rand()
    p.labels = rand(1..5).times.collect { labels.sample }.uniq
    p.save!
  end
end
posts = Post.all
puts "#{Post.count} posts have been persisted."
puts "#{Vote.count} votes have been cast."


# Create Comments
100.times do
  Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end
puts "#{Comment.count} comments were created"

puts "Seed finished"

include RandomData

#Creates users

5.times do
  User.create!(

  name: RandomData.random_name,
  email: RandomData.random_email,
  password: "remington"
  )

end
users = User.all

# Creates Topics

15.times do
  Topic.create!(
  name: RandomData.random_sentence,
  description: RandomData.random_paragraph
  )
end
topics = Topic.all



# Create Posts
50.times do
# #1
  Post.create!(
# #2
    user:   users.sample,
    topic:  topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
posts = Post.all


# Create Comments
# #3
100.times do
  Comment.create!(
# #4
    user: users.sample, 
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

#Create an Admin
admin = User.create!(
  name: "Wil Burke",
  email: "billyburke13@gmail.com",
  password: "mustang",
  role: 'admin'
)

# Create a member
member = User.create!(
  name:     'Member User',
  email:    'member@example.com',
  password: 'helloworld'
)

#Create a moderator
member = User.create!(
  name: "Megyn Kelly",
  email: "trump2016@gmail.com",
  password: "yuuuge",
  role: 'moderator'
)



puts "Seed finished"
puts "#{User.count} users were created"
puts "#{Topic.count} topics were created"
puts "#{Post.count} posts were created"
puts "#{Comment.count} comments were created"

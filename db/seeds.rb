# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'random_data'
# Create Users
5.times do
  User.create!(
  name:     RandomData.random_name,
  email:    RandomData.random_email,
  password: RandomData.random_sentence
  )
end

# Create an admin user
admin = User.create!(
  name:     'Admin User',
  email:    'admin@user.com',
  password: 'password',
  role:     'admin'
)

# Create a member
member = User.create!(
  name:     'Member User',
  email:    'member@user.com',
  password: 'password'
)

users = User.all



# Create Topics
15.times do
  Topic.create!(
    name:         RandomData.random_sentence,
    description:  RandomData.random_paragraph
  )
end
topics = Topic.all

# Create Posts
50.times do
  Post.create!(
    user:   users.sample,
    topic:  topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
posts = Post.all

50.times do
  SponsoredPost.create!(
    topic:  topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph,
    price: rand(1..100)
  )
end
sponsored_posts = SponsoredPost.all

# Create Comments
100.times do
  Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end
#
# unique_post = {title: "unique title", body: "unique body"}
# Post.find_or_create_by!(unique_post)
#
# unique_comment = { body: "unique comment body",
#                    post: Post.find_by!(unique_post) }
# Comment.find_or_create_by!(unique_comment)

50.times do
  Advertisement.create!(
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph,
    price: Random.rand(0..100)
  )
end
advertisements = Advertisement.all

25.times do
  Question.create!(
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph,
    resolved: [true,false].sample
  )
end
questions = Question.all

# Create answers
50.times do
  Answer.create!(
    question: questions.sample,
    body: RandomData.random_paragraph
  )
end



puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{SponsoredPost.count} sponsored posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
puts "#{Question.count} questions created"
puts "#{Answer.count} answers created"

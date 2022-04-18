require "faker"
# TODO: Write a seed to insert 100 posts in the database

100.times do
  posts = Post.new(
    title: Faker::Company.name,
    url: Faker::Cannabis.brand,
    votes: rand(0..5)
  )
  posts.save
end

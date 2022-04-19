require 'faker'
# TODO: Write a seed
user1 = User.new(username: "sergio")
user1.save

user2 = User.new(username: "oscar")
user2.save

user3 = User.new(username: "pila")
user3.save

user4 = User.new(username: "ander")
user4.save

user5 = User.new(username: "mati")
user5.save

rand(5..10).times do
  post1 = Post.new(title: Faker::Company.name, url: Faker::Cannabis.brand, votes: rand(0..5))
  post1.user_id = user1.id
  post1.save
end

rand(5..10).times do
  post2 = Post.new(title: Faker::Company.name, url: Faker::Cannabis.brand, votes: rand(0..5))
  post2.user_id = user2.id
  post2.save
end

rand(5..10).times do
  post3 = Post.new(title: Faker::Company.name, url: Faker::Cannabis.brand, votes: rand(0..5))
  post3.user_id = user3.id
  post3.save
end

rand(5..10).times do
  post4 = Post.new(title: Faker::Company.name, url: Faker::Cannabis.brand, votes: rand(0..5))
  post4.user_id = user4.id
  post4.save
end

rand(5..10).times do
  post5 = Post.new(title: Faker::Company.name, url: Faker::Cannabis.brand, votes: rand(0..5))
  post5.user_id = user5.id
  post5.save
end

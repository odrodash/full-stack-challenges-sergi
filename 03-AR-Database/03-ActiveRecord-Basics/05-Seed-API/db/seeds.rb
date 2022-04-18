require "json"
require "rest-client"

# TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.

read = RestClient.get "https://hacker-news.firebaseio.com/v0/topstories.json"
posts = JSON.parse(read)

def ids_parse(id)
  "https://hacker-news.firebaseio.com/v0/item/#{id}.json"
end

posts.take(10).each do |id|
  hacker_new_post = JSON.parse(RestClient.get(ids_parse(id)))
  new_post = Post.new(
    title: hacker_new_post["title"],
    url: hacker_new_post["url"],
    votes: hacker_new_post["votes"]
  )
  new_post.save
end

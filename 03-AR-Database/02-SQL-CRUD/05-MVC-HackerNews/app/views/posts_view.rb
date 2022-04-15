require_relative '../models/post'

class PostsView
  # TODO: implement methods called by the PostsController
  def display(posts)
    puts "All posts"
    posts.each do |post|
      puts "ID : #{post.id} - TITLE : #{post.title} - URL : #{post.url} - VOTES : #{post.votes}"
    end
  end

  def ask_for_user(item)
    puts "what is your #{item}"
    return gets.chomp
  end
end

class PostsView
  # TODO: implement some methods here when controller needs to `puts` or `gets`
  def display(posts)
    posts.each do |post|
      puts "ID: #{post.id} - TITLE: #{post.title} - URL: #{post.url} - VOTES: #{post.votes}"
    end
  end

  def ask_for_user(item)
    puts "what is #{item}"
    return gets.chomp
  end
end

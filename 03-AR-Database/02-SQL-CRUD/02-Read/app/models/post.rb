class Post
  attr_accessor :title, :url
  attr_reader :id, :votes
  def initialize (attributes = {})
    @id = attributes[:id]
    @votes = attributes[:votes]
    @title = attributes[:title]
    @url = attributes[:url]
  end

  def self.find(id)
    DB.results_as_hash = true
    post = DB.execute("SELECT * FROM posts WHERE id = (?)",id).first
    if post.nil?
      return nil
    else
    Post.new(id: post["id"], title: post["title"], url: post["url"], votes: post["votes"])
    end
  end

  def self.all
    DB.results_as_hash = true
    array = []
    posts = DB.execute("SELECT * FROM posts")
    posts.each do |post|
      array << Post.new(id: post["id"], title: post["title"], url: post["url"], votes: post["votes"])
    end
    array.empty? ? [] : array
  end
end

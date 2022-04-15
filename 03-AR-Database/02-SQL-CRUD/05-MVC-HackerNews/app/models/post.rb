require 'sqlite3'

class Post
  attr_accessor :title, :url, :votes
  attr_reader :id
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

  def destroy
    # TODO: destroy the current instance from the database
    DB.execute("DELETE FROM posts WHERE id = ?",@id)
  end

  def save
    if @id
      DB.execute("UPDATE posts SET title = ? , url = ?, votes = ? WHERE id = ?",@title, @url, @votes, @id)
    else
      DB.execute("INSERT INTO posts (url, votes, title) VALUES (?, ?, ?)", @url, @votes, @title)
      @id = DB.last_insert_row_id
    end
  end
end

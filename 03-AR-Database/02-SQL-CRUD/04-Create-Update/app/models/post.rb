class Post
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
    @title = attributes[:title]
  end

  # TODO
  def save
    if @id
      DB.execute("UPDATE posts SET title = ? , url = ?, votes = ? WHERE id = ?",@title, @url, @votes, @id)
    else
      DB.execute("INSERT INTO posts (url, votes, title) VALUES (?, ?, ?)", @url, @votes, @title)
      @id = DB.last_insert_row_id
    end
  end
end

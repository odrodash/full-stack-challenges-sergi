require_relative "../views/posts_view"

class PostsController
  def initialize
    @view = PostsView.new
  end

  def index
    # DO NOT WRITE SQL QUERIES
    # TODO: gather all posts from the database
    # TODO: give them to the view to be printed
    post = Post.all
    @view.display(post)
  end

  def create
    # DO NOT WRITE SQL QUERIES
    # TODO: create a post
    title = @view.ask_for_user("title")
    votes = @view.ask_for_user("votes")
    url = @view.ask_for_user("url")
    Post.new(title: title, votes: votes.to_i, url: url).save
  end

  def update
    # DO NOT WRITE SQL QUERIES
    # TODO: update a post
    index
    id = @view.ask_for_user("id")
    post = Post.find(id.to_i)
    post.nil? ? update : update_post(post)
    index
  end

  def destroy
    # DO NOT WRITE SQL QUERIES
    # TODO: destroy a post
    index
    id = @view.ask_for_user("id")
    post = Post.find(id.to_i)
    post.nil? ? destroy : destroy_post(post)
    index
  end

  def upvote
    # DO NOT WRITE SQL QUERIES
    # TODO: increment the `votes` column for a post
    index
    id = @view.ask_for_user("id")
    post = Post.find(id.to_i)
    post.nil? ? upvote : upvote_post(post)
    index
  end

  private

  def update_post(post)
    title = @view.ask_for_user("new title")
    url = @view.ask_for_user("new url")
    post.title = title
    post.url = url
    post.save
  end

  def destroy_post(post)
    post.destroy
  end

  def upvote_post(post)
    post.votes += 1
    post.save
  end
end

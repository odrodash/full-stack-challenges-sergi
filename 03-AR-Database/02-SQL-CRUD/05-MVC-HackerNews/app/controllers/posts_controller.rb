require_relative '../models/post'

class PostsController
  def initialize
    @view = PostsView.new
  end

  ################################################################
  # BEWARE: you MUST NOT use the global variable DB in this file #
  ################################################################

  def index
    # TODO: implement listing all posts
    posts = Post.all
    @view.display(posts)
  end

  def create
    # TODO: implement creating a new post
    title = @view.ask_for_user("title")
    votes = @view.ask_for_user("votes").to_i
    url = @view.ask_for_user("url")
    new_post = Post.new(title: title, votes: votes, url: url).save
  end

  def update
    # TODO: implement updating an existing post
    index
    id = @view.ask_for_user("id")
    post = Post.find(id.to_i)
    post.nil? ? update : update_post(post)

  end

  def destroy
    # TODO: implement destroying a post
    index
    id = @view.ask_for_user("id")
    post = Post.find(id.to_i)
    post.nil? ? destroy : destroy_post(post)
  end

  def upvote
    # TODO: implement upvoting a post
    index
    id = @view.ask_for_user("id")
    post = Post.find(id.to_i)
    new_votes = @view.ask_for_user("new votes")
    post.votes = new_votes
    post.save
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
end

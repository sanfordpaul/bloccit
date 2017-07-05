class PostsController < ApplicationController
  def index
    @posts = Post.all
    range = 1 .. @posts.count
    range.step(5) do |index|
      post = @posts.find(index)
      post.update(title: "SPAM")
    end
  end

  def show
  end

  def new
  end

  def edit
  end
end

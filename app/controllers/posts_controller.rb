class PostsController < ApplicationController
  def index
    @posts = Post.order("posts").page(params[:page]).per_page(2)
  end

  def show
    @post = Post.find(params[:id])
  end
end

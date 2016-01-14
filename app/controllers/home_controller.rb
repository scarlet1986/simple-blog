class HomeController < ApplicationController
  def index
    @posts = Post.limit(5).order(id: :desc)
    @news_items = NewsItem.limit(5).order(id: :desc)
  end
end

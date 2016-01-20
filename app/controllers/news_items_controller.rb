class NewsItemsController < ApplicationController
  def index
    @news_items = NewsItem.order("news_items").page(params[:page]).per_page(2)
  end

  def show
    @news_item = NewsItem.find(params[:id])
  end
end

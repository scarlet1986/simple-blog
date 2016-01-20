class Admin::NewsItemsController < Admin::ApplicationController
  def new
    @news_item = NewsItem.new
  end
  def create
    @news_item = NewsItem.new(news_item_params)

    if @news_item.save
    redirect_to [:admin, @news_item]
    else
     render 'new'
    end
  end
  def index
    @news_items = NewsItem.order("news_items").page(params[:page]).per_page(2)
  end
  def show
    @news_item = NewsItem.find(params[:id])
  end
  def edit
    @news_item = NewsItem.find(params[:id])
  end
  def update
    @news_item = NewsItem.find(params[:id])

    if @news_item.update(news_item_params)
      redirect_to [:admin, @news_item]
    else
      render 'edit'
    end
  end
  def destroy
    @news_item = NewsItem.find(params[:id])
    @news_item.destroy

    redirect_to [:admin, :news_item]
  end

  private
    def news_item_params
      params.require(:news_item).permit(:title, :content)
    end
end

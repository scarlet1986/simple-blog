class Admin::PostsController < Admin::ApplicationController
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)

    if @post.save
    redirect_to [:admin, @post]
    else
     render 'new'
    end
  end
  def index
    @posts = Post.order("posts").page(params[:page]).per_page(2)
  end
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = @post.comments.new
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to [:admin, @post]
    else
      render 'edit'
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to [:admin, :posts]
  end

  private
    def post_params
      params.require(:post).permit(:title, :content)
    end
end

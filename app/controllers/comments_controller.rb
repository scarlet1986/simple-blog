class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to @comment.commentable }
        format.json { render json: @comment.to_json }
        format.js
      end
    else
     render '_comment_form'
    end
  end

  def index
    @comments = Comment.all

    respond_to do |format|
      format.html
      format.json{ render json: @comments.to_json }
    end
  end
  def comment_params
    params.require(:comment).permit(:author, :content, :commentable_id, :commentable_type)
  end
end

class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @comment.commentable
    else
     render '_comment_form'
    end
  end
  def comment_params
    params.require(:comment).permit(:author, :content, :commentable_id, :commentable_type)
  end
end

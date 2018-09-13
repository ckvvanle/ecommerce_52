class CommentsController < ApplicationController
  def create
    @comment = Comment.new comment_params
    if @comment.save
      flash[:success] = t ".new_comment"
    else
      flash[:danger] = t ".not_comment"
    end
    redirect_to product_path(@comment.product_id)
  end

  private
  def comment_params
    params.require(:comment)
          .permit :content, :user_id, :product_id
  end
end

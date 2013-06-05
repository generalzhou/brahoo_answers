class CommentsController < ApplicationController

  def create
    comment = Comment.new(params[:comment])
    if comment.save
      flash[:success] = "Your comment was posted successfully!"
    else
      flash.now[:error] = "Unsuccessful comment attempt!"
    end
    redirect_to :back
  end

  def edit
    comment = Comment.find(params[:id])
    redirect_to :back
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to :back
  end
end

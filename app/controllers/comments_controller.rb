class CommentsController < ApplicationController

  def create
    comment = Comment.new(params[:comment])
    if comment.save
      flash.now[:success] = "Your comment was posted successfully!"
    else
      flash.now[:error] = "Unsuccessful comment attempt!"
    end
    redirect_to :back
  end

  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
    comment = Comment.find(params[:id])
    if comment.update_attributes(params[:comment])
      flash[:success] = "Your comment was updated successfully!"
      redirect_to question_path(comment.question_id)
    else
      flash.now[:error] = "Your edit was unsuccessful!"
      redirect_to :back
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:success] = "Your comment was deleted successfully!"
    redirect_to :back
  end
end

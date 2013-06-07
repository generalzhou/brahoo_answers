class CommentsController < ApplicationController

  def create

    comment = Comment.new(:commentable_id => params[:commentable_id],
                          :commentable_type => params[:commentable_type],
                          :text => params[:comment][:text],
                          )
    comment.user = current_user
    if comment.save
      if request.xhr?
        render partial: 'display_comments', locals: {parent: comment.commentable}
      else
        redirect_to :back
      end
    else
      flash.now[:error] = "Unsuccessful comment attempt!"
      redirect_to :back
    end

  end

  def edit
    @comment = Comment.find(params[:id])
    redirect_to :back unless @comment.user == current_user
  end

  def update
    comment = Comment.find(params[:id])
    if comment.update_attributes(params[:comment]) && comment.user == current_user
      flash[:success] = "Your comment was updated successfully!"
      redirect_to question_path(comment.question_id)
    else
      flash.now[:error] = "Your edit was unsuccessful!"
      redirect_to :back
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.user == current_user && comment.destory
      flash[:success] = "Your comment was deleted successfully!"
    end
    redirect_to :back
  end
end

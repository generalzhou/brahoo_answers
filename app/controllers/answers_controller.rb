class AnswersController < ApplicationController

  def create
    answer = Answer.new(params[:answer])
    answer.user = current_user
    if answer.save
      flash[:success] = "Your answer was posted successfully!"
    else
      flash.now[:error] = "Unsuccessful answer attempt!"
    end
    redirect_to :back
  end

  def edit
    @answer = Answer.find(params[:id])
    redirect_to :back unless @answer.user == current_user
  end

  def update
    answer = Answer.find(params[:id])
    if answer.update_attributes(params[:answer]) && answer.user == current_user
      flash[:success] = "Your answer was updated successfully!"
      redirect_to question_path(answer.question_id)
    else
      flash.now[:error] = "Your edit was unsuccessful!"
      redirect_to :back
    end
  end

  def destroy
    answer = Answer.find(params[:id])
    if answer.user == current_user && answer.destroy
      flash[:success] = "Your comment was deleted successfully!"
    end
    redirect_to :back
  end
end

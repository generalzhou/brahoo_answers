class AnswersController < ApplicationController

  def create
    answer = Answer.new(params[:answer])
    if answer.save
      flash[:success] = "Your answer was posted successfully!"
    else
      flash.now[:error] = "Unsuccessful answer attempt!"
    end
    redirect_to :back
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    answer = Answer.find(params[:id])
    if answer.update_attributes(params[:answer])
      flash[:success] = "Your answer was updated successfully!"
      redirect_to question_path(answer.question_id)
    else
      flash.now[:error] = "Your edit was unsuccessful!"
      redirect_to :back
    end
  end

  def destroy
    Answer.find(params[:id]).destroy
    redirect_to :back
  end
end

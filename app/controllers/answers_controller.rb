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
    answer = Answer.find(params[:id])
    redirect_to :back
  end

  def destroy
    Answer.find(params[:id]).destroy
    redirect_to :back
  end
end

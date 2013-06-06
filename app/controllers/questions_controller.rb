class QuestionsController < ApplicationController
  skip_before_filter :require_login, :only => [:index, :show]

  def index
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question], :user => current_user)
    if @question.valid?
      flash[:success] = "Your question got added brah"
      @question.save!
      redirect_to @question
    else
      flash.now[:error] = "Bro, your question makes no sense"
      render :new
    end
  end

  def show
    @question = Question.find_by_id(params[:id])
  end

  def edit
    @question = Question.find_by_id(params[:id])
  end

  def update
    question = Question.find(params[:id])
    if question.update_attributes(params[:question], :user => current_user)
      flash[:success] = "Your question got edited brah"
      redirect_to question
    else
      flash.now[:error] = "Naw bro that ain't gonna work"
      render :edit
    end
  end

  def destroy
    Question.find_by_id(params[:id]).destroy
    redirect_to root_path
  end

end

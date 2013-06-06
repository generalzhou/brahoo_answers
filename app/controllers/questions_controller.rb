class QuestionsController < ApplicationController
  skip_before_filter :require_login, :only => [:index, :show]

  def index
    @questions = Question.paginate(:page => params[:page])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    @question.user = current_user

    if @question.save
      flash[:success] = "Your question got added brah"
      redirect_to @question
    else
      flash.now[:error] = "Bro, your question makes no sense"
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    question = Question.find(params[:id])

    if question.user == current_user && question.update_attributes(params[:question])
      flash[:success] = "Your question got edited brah"
      redirect_to question
    else
      flash.now[:error] = "Naw bro that ain't gonna work"
      render :edit
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    redirect_to root_path
  end

end

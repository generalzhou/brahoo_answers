class UsersController < ApplicationController
  skip_before_filter :require_login

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:current_user_id] = @user.id
      flash[:success] = "You have signed up successfully!"
      redirect_to @user
    else
      flash.now[:error] = @user.errors.full_messages.first
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end
end

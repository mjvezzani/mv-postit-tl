class UsersController < ApplicationController

  before_action :require_user, only: [:show]

  def show
    @user = User.find_by(slug: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      flash[:notice] = "Welcome to postit!"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find_by(slug: params[:id])
  end

  def update
    @user = User.find_by(slug: params[:id])

    if @user.update(user_params)
      flash[:notice] = 'You have successfully updated your profile'
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end

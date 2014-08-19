class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.where(username: params[:username]).first
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome back!"
      redirect_to root_path
    else
      flash[:error] = "Please check your login credentials"
      redirect_to :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "See you next time!"
    redirect_to root_path
  end

end

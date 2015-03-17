class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.where(email: params[:email]).first

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "You are now logged in."
      redirect_to videos_path
    else
      flash[:danger] = "Something is wrong."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You are now logged out."
    redirect_to root_path
  end
end
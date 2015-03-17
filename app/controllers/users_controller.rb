class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Your account as been created!"
      redirect_to login_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name)
  end

  def set_user
    @user = User.find_by params[:id]
  end

end
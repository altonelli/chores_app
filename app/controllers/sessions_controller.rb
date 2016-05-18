class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    user_params = params.require(:user).permit(:email, :password)
    @user = User.confirm(user_params)
    if @user.save
      login(@user)
      flash[:success] = "You are logged-in!"
      redirect_to unit_path(unit_of_user(@user))
    else
      flash[:error] = "Please enter a valid email and/or password to login"
      redirect_to login_path
    end
  end

  def destroy
    logout
    flash[:success] = "You have successfully logged out."
    redirect_to root_path
  end
end

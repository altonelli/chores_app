class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    puts "PARAMS: " + params.to_s
    user_params = params.require(:user).permit(:email, :password)
    @user = User.confirm(user_params)
    if @user && @user.save
      login(@user)
      flash[:success] = "You are logged-in!"
      if unit_of_user(@user)
        redirect_to unit_path(unit_of_user(@user))
      else
        redirect_to units_path
      end
    else
      flash[:error] = "Please enter a valid email and/or password to login"
      redirect_to login_path
    end
  end

  def demo
    user_params = {"email"=>"john.doe@demo.com", "password"=>"1234"}
    @user = User.confirm(user_params)
    if @user && @user.save
      login(@user)
      flash[:success] = "You are logged-in!"
      if unit_of_user(@user)
        redirect_to unit_path(unit_of_user(@user))
      else
        redirect_to units_path
      end
    else
      flash[:error] = "Something went wrong. Demo account is currently not working."
      redirect_to login_path
    end
  end

  def destroy
    logout
    flash[:success] = "You have successfully logged out."
    redirect_to root_path
  end
end

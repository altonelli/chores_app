class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    redirect_to unit_users_path
    # render :index
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find_by_id(params[:id])
    puts @user.unit_id
    render :show
  end

  # GET /users/new
  def new
    @user = User.new
    render :new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
    login (@user)
    flash[:success] = "Welcome to our app!!"
    redirect_to units_path
    else
    render :new
    end
  end

  # GET /users/1/edit
  def edit
    user_id = params[:id]
    @user = User.find_by_id(user_id)
    render :edit
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if params[:state] && params[:unit]
      unit = Unit.find(params[:unit])
      current_user.state = "pending"
      unit.users << current_user
    else
      user_id = params[:id]
      user = User.find_by_id(user_id)
      user.update_attributes(user_params)
      flash[:notice] = "User Updated"
      redirect_to unit_of_user(user)
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    user_id = params[:id]
    @user = User.find_by_id(user_id)
    @user=current_user
    User.destroy(@user)
    flash[:success] = "User Deleted!!"
    redirect_to root_path
  end

  private

    def set_user
      User.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :phone, :password)
    end
end

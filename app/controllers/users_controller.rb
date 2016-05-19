class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  # GET /users/new
  def new
    @user = User.new
    render :new
  end

  # POST /users
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


  # PATCH/PUT /users/1
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
  def destroy
    user_id = params[:id]
    @user = User.find_by_id(user_id)
    if @user === current_user
      @unit
      @user.units.each do |unit|
        if state(unit,@user) === "approved"
          @unit = unit
        end
      end
      if @user.chores.count === 0
        if @unit.users.count > 1
          UnitUser.where("user_id = :user_id and state = :state", {user_id: @user.id.to_s, state: "approved"}).first.destroy
          flash[:notice] = "#{@user.name} was removed from the unit."
          redirect_to units_path
        else
          flash[:error] = "Unit must have at least one roommate remaining."
          redirect_to unit_path(@unit)
        end
      else
        flash[:error] = "Must have no chores to leave unit"
        redirect_to unit_path(@unit)
      end
    else
      flash[:error] = "Unauthorized."
      redirect_to unit_path(unit_of_user(current_user))
    end
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

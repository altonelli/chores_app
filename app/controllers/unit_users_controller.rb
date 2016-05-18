class UnitUsersController < ApplicationController


  def create
    if current_user
      @unit = Unit.find(params[:unit_id])
      @user = User.find(params[:user_id])
      if params[:state]
        @unit.users << @user
        # @user.unit_id = @unit.id
        change_state(@unit,@user,params[:state])
      end
      redirect_to units_path
    else
      flash[:error] = "You must be logged in to join a unit!"
    redirect_to login_path
    end
  end

  def destroy
    @unit = Unit.find(params[:unit_id])
    @user = User.find(params[:user_id])
      if current_user == @user
        UnitUser.where("unit_id = :unit_id and user_id = :user_id", {unit_id: @unit.id.to_s, user_id: @user.id.to_s}).first.destroy
        redirect_to units_path
      else
        flash[:error] = "You must be logged in to do that!"
        redirect_to login_path
      end
  end

  def update
  @unit = Unit.find(params[:unit_id])
  @user = User.find(params[:user_id])
    if state(@unit, current_user) == "approved"
      if params[:state]
        change_state(@unit,@user,params[:state])
      end
      redirect_to unit_path(@unit)
    else
      flash[:error] = "You must be a member of the unit to perform that action!"
      redirect_to units_path
    end
  end


end

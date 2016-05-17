class UnitUsersController < ApplicationController


  def create
    @unit = Unit.find(params[:unit_id])
    @user = User.find(params[:user_id])
    if params[:state]
      @unit.users << @user
      # @user.unit_id = @unit.id
      change_state(@unit,@user,params[:state])
    end
    redirect_to units_path
  end

  def destroy
    @unit = Unit.find(params[:unit_id])
    @user = User.find(params[:user_id])
    UnitUser.where("unit_id = :unit_id and user_id = :user_id", {unit_id: @unit.id.to_s, user_id: @user.id.to_s}).first.destroy
    redirect_to units_path
  end

  def update
    @unit = Unit.find(params[:unit_id])
    @user = User.find(params[:user_id])
    if params[:state]
      change_state(@unit,@user,params[:state])
    end
    redirect_to unit_path(@unit)
  end


end

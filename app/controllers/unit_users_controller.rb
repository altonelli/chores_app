class UnitUsersController < ApplicationController


  def update
    @unit = Unit.find(params[:unit_id])
    @user = User.find(params[:user_id])
    if params[:state]
      @unit.users << @user
      UnitUser.where("unit_id = :unit_id and user_id = :user_id", {unit_id: @unit.id.to_s, user_id: @user.id.to_s}).first.update(state: params[:state])
    end
    redirect_to units_path
  end


end

class UnitsController < ApplicationController
  before_action :set_unit, only: [:show, :edit, :update, :destroy]

  # GET /units
  # GET /units.json
  def index
    @units = Unit.all
  end

  # GET /units/1
  # GET /units/1.json
  def show
    if state(@unit, current_user) == "approved"
      render :show
    else
      flash[:error] = "Oops! You need to join a unit in order to view it!"
      redirect_to units_path
    end
  end

  # GET /units/new
  def new
    @unit = Unit.new
  end

  # GET /units/1/edit
  # def edit
  #   if state(@unit, current_user) == "approved"
  #     render :edit
  #   else
  #     flash[:error] = "Oops! You need to join a unit in order to view it!"
  #     redirect_to units_path
  #   end
  # end

  # POST /units
  # POST /units.json
  def create
    if current_user
    @unit = Unit.new(unit_params)
      name = @unit.name
      @unit.users << current_user
      current_user.units.each do |unit|
        if state(unit,current_user) === "approved"
          flash[:error] = "You are already a amember of unit #{unit.name}. You must deactivate to create a new unit."
          redirect_to units_path
        end
      end
      if @unit.save
        change_state(@unit,current_user,"approved")
        flash[:notice] = "#{@unit.name} was saved."
        redirect_to unit_path(@unit)
      else
        flash[:notice] = "#{name} failed to update."
        redirect_to new_unit_path
      end
    else
      redirect_to root_path
    end
  end

  # PATCH/PUT /units/1
  # PATCH/PUT /units/1.json
  def update
    if state(@unit,current_user) === "approved"
      if @unit.update(unit_params)
        flash[:notice] = "#{@unit.name} was successfully updated"
        redirect_to unit_path(@unit)
      else
        flash[:error] = "#{@unit.name} failed to update"
        redirect_to edit_unit_path(@unit)
      end
    else
      flash[:error] = "Unauthorized"
      redirect_to units_path
    end
  end

  # DELETE /units/1
  # DELETE /units/1.json
  # def destroy
  #   if state(@unit, current_user) == "approved"
  #     name = @unit.name
  #     @unit = Unit.find
  #     if @unit.destroy
  #       flash[:notice] = "#{name} was destroyed"
  #       redirect_to units_path
  #     else
  #       flash[:notice] = "#{name} persists"
  #       redirect_to unit_path(@unit)
  #     end
  #   else
  #     flash[:notice] = "I'm sorry, you do not have permission to do that!"
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      @unit = Unit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_params
      params.require(:unit).permit(:name, :address, :landlord_name, :landlord_phone, :landlord_email)
    end
end

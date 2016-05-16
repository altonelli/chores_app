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
    render :show
  end

  # GET /units/new
  def new
    @unit = Unit.new
  end

  # GET /units/1/edit
  def edit
  end

  # POST /units
  # POST /units.json
  def create
    @unit = Unit.new(unit_params)
    user = User.create({name: "Mom", email: "mom@test.com", password: "a"})
    @unit.users << user
      name = @unit.name
      @unit.users << current_user
      if @unit.save
        flash[:notice] = "#{@unit.name} was saved."
        redirect_to unit_path(@unit)
      else
        flash[:notice] = "#{name} failed to update."
        redirect_to new_unit_path
      end
  end

  # PATCH/PUT /units/1
  # PATCH/PUT /units/1.json
  def update

      if @unit.update(unit_params)
        flash[:notice] = "#{@unit.name} was successfully updated"
        redirect_to unit_path(@unit)
      else
        flash[:error] = "#{@unit.name} failed to update"
        redirect_to edit_unit_path(@unit)
      end

  end

  # DELETE /units/1
  # DELETE /units/1.json
  def destroy
    name = @unit.name
    if @unit.destroy
      flash[:notice] = "#{name} was destroyed"
      redirect_to units_path
    else
      flash[:notice] = "#{name} persists"
      redirect_to unit_path(@unit)
    end
  end

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

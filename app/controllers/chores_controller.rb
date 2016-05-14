class ChoresController < ApplicationController
  before_action :set_unit, only: [:index, :create, :new]
  before_action :set_chore, only: [:show, :edit, :update, :destroy]

  # GET /chores
  # GET /chores.json
  def index
    @chores = Chore.all
  end

  # GET /chores/1
  # GET /chores/1.json
  def show
  end

  # GET /chores/new
  def new
    @chore = Chore.new
  end

  # GET /chores/1/edit
  def edit
  end

  # POST /chores
  # POST /chores.json
  def create
    @chore = Chore.new(chore_params)
    @chore.save
    private_user = @unit.users.find_by(name: "Mom")
    private_user.chores << @chore
    UserChore.where(chore_id: @chore.id).first.update({completed: false})
    redirect_to unit_chores_path(@unit)
  end

  # PATCH/PUT /chores/1
  # PATCH/PUT /chores/1.json
  def update

  end

  # DELETE /chores/1
  # DELETE /chores/1.json
  def destroy
    @chore.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      @unit = Unit.find(params[:unit_id])
    end

    def set_chore
      @chore = Chore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chore_params
      params.require(:chore).permit(:title, :details)
    end
end

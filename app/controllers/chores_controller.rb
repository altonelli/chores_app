class ChoresController < ApplicationController
  before_action :set_unit, only: [:index, :create, :new]
  before_action :set_chore, only: [:show, :edit, :update, :destroy]

  # GET /chores
  # GET /chores.json
  def index
    @chores = @unit.chores.distinct
    puts("CHORES: " + @chores.to_s)
    @chore = @chores.first
    @user_chore = UserChore.where(chore_id: @chore.id).first
  end

  # GET /chores/1
  # GET /chores/1.json
  def show

  end

  # GET /chores/new
  def new
    @chore = Chore.new
    @user_chore = UserChore.new
  end

  # GET /chores/1/edit
  def edit
    @unit = @chore.users.first.unit
  end

  # POST /chores
  # POST /chores.json
  def create
    @chore = Chore.new(chore_params)
    if @chore.save
      params[:user_chore][:user_id].each { |num| if !num.blank? then User.find(num.to_i).chores << @chore end}
      UserChore.where(chore_id: @chore.id).update_all({completed: false})
      redirect_to unit_chores_path(@unit)
    else
      flash[:error] = "Woops! It seems you're forgetting something! Please enter a valid title and details before submitting a chore."
    end
  end

  # PATCH/PUT /chores/1
  # PATCH/PUT /chores/1.json
  def update
    @unit = @chore.users.first.unit
    @chore.update(chore_params)
    redirect_to unit_chores_path(@unit)
  end

  # DELETE /chores/1
  # DELETE /chores/1.json
  def destroy
    @unit = @chore.users.first.unit
    @chore.destroy
    redirect_to unit_chores_path(@unit)
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

    def user_chore_params
      params.require(:user_chore).permit(:user_id)
    end
end

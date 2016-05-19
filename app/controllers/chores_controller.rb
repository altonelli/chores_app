class ChoresController < ApplicationController
  before_action :set_unit, only: [:index, :create, :new]
  before_action :set_chore, only: [:show, :edit, :update, :destroy]
  before_action :set_approved_users

  # GET /chores
  # GET /chores.json
  def index
    @new_chore = Chore.new
    @chores = []
    @unit.chores.each do |chore|
      if chore_of_unit?(chore,@unit) && !@chores.include?(chore)
        @chores << chore
      end
    end
    @chore = @chores.first
    if @chores.count > 0
      @user_chore = UserChore.where(chore_id: @chore.id).first
      @date_user_chore = @user_chore
    else
      @user_chore = UserChore.new
      @chore = Chore.new
    end
    render :index
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
    @unit
    @chore.users.first.units.each do |unit|
      if chore_of_unit?(@chore,unit)
        @unit = unit
      end
    end

  end

  # POST /chores
  # POST /chores.json
  def create
    @chore = Chore.new(chore_params)

    deadline = nil
    if @unit.chores.count > 0
      @unit.chores.each do |chore|
        if chore_of_unit?(chore,@unit)
          deadline = UserChore.where(chore_id: chore.id).first.due_date
          break
        end
      end
    end

    if params[:user_chore][:user_id][0].blank?
      flash[:error] = "Chore must be assigned to someone."
      return redirect_to new_unit_chore_path(@unit)
    elsif @chore.save
      params[:user_chore][:user_id].each { |num| if !num.blank? then User.find(num.to_i).chores << @chore end}

      if deadline.nil?
        deadline = Time.at(Time.now.to_i + 604800)
      end

      UserChore.where(chore_id: @chore.id).update_all({completed: false, due_date: deadline})
      flash[:notice] = "#{@chore.title} was successfully updated."
    else
      flash[:error] = "Woops! It seems you're forgetting something! Please enter a valid title and details before submitting a chore."
    end
    redirect_to unit_chores_path(@unit)
  end


  #############Need to also update date

  # PATCH/PUT /chores/1
  # PATCH/PUT /chores/1.json
  def update
    @unit
    @chore.users.first.units.each do |unit|
      if chore_of_unit?(@chore,unit)
        @unit = unit
      end
    end
    @chore.update(chore_params)
    redirect_to unit_chores_path(@unit)
  end

  # DELETE /chores/1
  # DELETE /chores/1.json
  def destroy
    @unit
    @chore.users.first.units.each do |unit|
      if chore_of_unit?(@chore,unit)
        @unit = unit
      end
    end
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

    def set_approved_users
      @approved_users = []
      @unit.users.each do |user|
        if state(@unit,user) === "approved"
          @approved_users << user
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chore_params
      params.require(:chore).permit(:title, :details)
    end

    def user_chore_params
      params.require(:user_chore).permit(:user_id)
    end
end

class UserChoresController < ApplicationController
  before_action :set_user_chore, only: [:show, :edit, :update, :destroy]

  # GET /user_chores
  # GET /user_chores.json
  def index
    @user_chores = UserChore.all
  end

  # GET /user_chores/1
  # GET /user_chores/1.json
  def show
  end

  # GET /user_chores/new
  def new
    @user_chore = UserChore.new
  end

  # GET /user_chores/1/edit
  def edit
  end

  # POST /user_chores
  # POST /user_chores.json
  def create
    @user_chore = UserChore.new(user_chore_params)

    respond_to do |format|
      if @user_chore.save
        format.html { redirect_to @user_chore, notice: 'User chore was successfully created.' }
        format.json { render :show, status: :created, location: @user_chore }
      else
        format.html { render :new }
        format.json { render json: @user_chore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_chores/1
  # PATCH/PUT /user_chores/1.json
  def update
    respond_to do |format|
      if @user_chore.update(user_chore_params)
        format.html { redirect_to @user_chore, notice: 'User chore was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_chore }
      else
        format.html { render :edit }
        format.json { render json: @user_chore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_chores/1
  # DELETE /user_chores/1.json
  def destroy
    @user_chore.destroy
    respond_to do |format|
      format.html { redirect_to user_chores_url, notice: 'User chore was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_chore
      @user_chore = UserChore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_chore_params
      params.require(:user_chore).permit(:due_date, :completed)
    end
end

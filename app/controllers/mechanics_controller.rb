class MechanicsController < ApplicationController
  before_action :set_mechanic, only: [:show, :edit, :update, :destroy]
  skip_before_action :user_authorized
  skip_before_action :mechanic_authorized, only: [:new, :create, :show]
  skip_before_action :unauth, only: [:new, :create]
  # GET /mechanics
  # GET /mechanics.json
  def index
    @mechanics = Mechanic.all
  end

  # GET /mechanics/1
  # GET /mechanics/1.json
  def show
    if current_mechanic != @mechanic
      flash[:hack] = "http://i.stack.imgur.com/SBv4T.gif"
      flash[:hack_m] = "YOU SHALL NOT PASS"
      if user_logged_in?
        redirect_to user_path(current_user)
      else
      redirect_to mechanic_path(current_mechanic)
    end
  end
end

  # GET /mechanics/new
  def new
    @mechanic = Mechanic.new
  end

  # GET /mechanics/1/edit
  def edit
  end

  # POST /mechanics
  # POST /mechanics.json
  def create
    @mechanic = Mechanic.new(mechanic_params)

    respond_to do |format|
      if @mechanic.save
        session[:mechanic_id] = @mechanic.id
        format.html { redirect_to @mechanic, notice: 'Mechanic was successfully created.' }
        format.json { render :show, status: :created, location: @mechanic }
      else
        format.html { render :new }
        format.json { render json: @mechanic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mechanics/1
  # PATCH/PUT /mechanics/1.json
  def update
    respond_to do |format|
      if @mechanic.update(mechanic_params)
        format.html { redirect_to @mechanic, notice: 'Mechanic was successfully updated.' }
        format.json { render :show, status: :ok, location: @mechanic }
      else
        format.html { render :edit }
        format.json { render json: @mechanic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mechanics/1
  # DELETE /mechanics/1.json
  def destroy
    @mechanic.destroy
    respond_to do |format|
      format.html { redirect_to mechanics_url, notice: 'Mechanic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mechanic
      @mechanic = Mechanic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mechanic_params
      params.require(:mechanic).permit(:name, :experience, :locaiton, :range, :password, :username, :user_id)
    end
end

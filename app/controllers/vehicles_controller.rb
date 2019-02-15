class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  skip_before_action :mechanic_authorized
  skip_before_action :user_authorized, only: [:new, :create, :show]

  # GET /vehicles
  # GET /vehicles.json
  def index
    @vehicles = Vehicle.all
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
    flash[:vehicle_id] = params[:id]
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
    @user = session[:user_id].to_i
  end

  # GET /vehicles/1/edit
  def edit
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    if params[:o_type] == nil || params[:viscosity] == nil
     flash[:no_oil] = "You Must Enter A Oil Type And Oil Viscosity"
     redirect_to new_vehicle_path
   else
    params[:vehicle][:oil_type] = params[:o_type] + params[:viscosity]
    @vehicle = Vehicle.new(vehicle_params)
    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end
end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
    if params[:o_type] == nil || params[:viscosity] == nil
     flash[:no_oil] = "You Must Enter A Oil Type And Oil Viscosity"
     redirect_to edit_vehicle_path
   else
    respond_to do |format|
      params[:vehicle][:oil_type] = params[:o_type] + params[:viscosity]
      if @vehicle.update(vehicle_params)
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end
end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle.appointments.each do |appointment|
      appointment.destroy
    end
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to user_path(session[:user_id]), notice: 'Vehicle was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.require(:vehicle).permit(:year, :make, :model, :plate, :oil_type, :oil_quantity, :user_id, :image, :o_type, :viscosity)
    end
end

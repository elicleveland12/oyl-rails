class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  skip_before_action :mechanic_authorized
  skip_before_action :user_authorized

  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all
    if session[:user_id]
      @user = User.find(session[:user_id])
    elsif session[:mechanic_id]
      @mechanic = Mechanic.find(session[:mechanic_id])
    end
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    byebug
    @user = params[:id]
    @payment = Payment.new
    @mechanic_id = flash[:mechanic_id]
  end

  # GET /payments/1/edit
  def edit

    @user_id = session[:user_id]
    @mechanic = Mechanic.find_by(id: @payment.mechanic.id).id
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(payment_params)

    respond_to do |format|
      if @payment.save
        format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:name_on_card, :card_number, :expiration, :security_code, :user_id, :mechanic_id, :amount)
    end
end

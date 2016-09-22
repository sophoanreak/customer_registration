class CustomerHistoriesController < ApplicationController
  before_action :set_customer_history, only: [:show, :edit, :update, :destroy]
  before_action :set_customer
  before_action :authenticate_user! 
  # GET /customer_histories
  # GET /customer_histories.json
  def index
    @customer_histories = CustomerHistory.all
  end

  # GET /customer_histories/1
  # GET /customer_histories/1.json
  def show
  end

  # GET /customer_histories/new
  def new
    @customer_history = CustomerHistory.new
  end

  # GET /customer_histories/1/edit
  def edit
  end

  # POST /customer_histories
  # POST /customer_histories.json
  def create
    @customer_history = CustomerHistory.new(customer_history_params)
    @customer_history.customer_id = @customer.id

    respond_to do |format|
      if @customer_history.save
        format.html { redirect_to customer_path(@customer), notice: 'Customer history was successfully created.' }
        format.json { render :show, status: :created, location: @customer_history }
      else
        format.html { render :new }
        format.json { render json: @customer_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_histories/1
  # PATCH/PUT /customer_histories/1.json
  def update
    respond_to do |format|
      if @customer_history.update(customer_history_params)
        format.html { redirect_to customer_path(@customer), notice: 'Customer history was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer_history }
      else
        format.html { render :edit }
        format.json { render json: @customer_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_histories/1
  # DELETE /customer_histories/1.json
  def destroy
    @customer_history.destroy
    respond_to do |format|
      format.html { redirect_to customer_path(@customer), notice: 'Customer history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_history
      @customer_history = CustomerHistory.find(params[:id])
    end

    def set_customer
      @customer = Customer.find(params[:customer_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_history_params
      params.require(:customer_history).permit(:date_create, :problem, :solution, :remark)
    end
end

class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:search, :index, :show]
  before_action :check_user, except: [:search, :index, :show]
  before_action :check_reference, except: [:search, :index, :show]
  
  def search
    if params[:search].present?
      @customers = Customer.search(params[:search])
    else
      @customers = Customer.all
    end
  end  

  def email
       @customers = Customer.all.order("created_at DESC")
  end

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all.order("created_at DESC").paginate(page: params[:page], per_page: 8)
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @services = Service.where(customer_id: @customer.id)
    @customer_histories = CustomerHistory.where(customer_id: @customer.id)
    @references = Reference.where(id: @customer.service_id)
    if Reference.exists?(@customer.service_id)
      @refer = Reference.find(@customer.service_id)
    else
      redirect_to root_path, alert: "Please, Edit the existing data (Referrer). Need a referrer to go onward"
    end
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)
    @customer.user_id = current_user.id

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def check_user
      unless current_user.admin?
        redirect_to root_url, alert: "sorry, you are not an admin"
      end
    end

    def check_reference
      if Reference.exists?
        
      else
        redirect_to new_reference_path, alert: "Please, Create a Nil data or insert a real data to begin"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :kanji_first_name, :kanji_last_name, :sex, :tel_japan, :email_japan, :address, :remark, :image, :arrival_date, :customer_type, :service_id)
    end
end

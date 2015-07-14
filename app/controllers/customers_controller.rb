require 'rqrcode_png'

class CustomersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # get user info from ajax
  def userinfo
    puts "reached userinfo"
    puts params[:customer_email]
    puts params[:customer_id]

    # generate qrcode using users email
    @email = params[:customer_email]
    @qr = RQRCode::QRCode.new(@email).to_img.resize(250, 250).to_data_url

    # return QRimage to json to render to view
    render :json => {'customer_email_result' => @qr}
  end

  # GET /customers
  # GET /customers.json
  def index

    # pass email variable here
    # puts "reach index"
    # puts params[:customer_email]
    # puts params[:customer_id]
    #
    # if Customer.where(:email => params[:customer_email].blank?
    #   @customers = Customer.create(:email => params[:customer_email])
    # end
    #
    # @customers = Customer.find_by(email: @customers.email)

    @customers = Customer.all

    # ask shopify to render like native liquid page
    render content_type: 'application/liquid'
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    redirect_to action: "index"

    # ask shopify to render like native liquid page
    render content_type: 'application/liquid'
  end

  # GET /customers/new
  def new
    @customer = Customer.new

    # ask shopify to render like native liquid page
    render content_type: 'application/liquid'
  end

  # GET /customers/1/edit
  def edit

    # ask shopify to render like native liquid page
    render content_type: 'application/liquid'
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end

    # ask shopify to render like native liquid page
    render content_type: 'application/liquid'
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

    # ask shopify to render like native liquid page
    render content_type: 'application/liquid'
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:customer_id, :email, :occupation, :birthday, :shop_domain, :avatar)
    end
end

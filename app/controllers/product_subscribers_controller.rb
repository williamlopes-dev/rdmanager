class ProductSubscribersController < ApplicationController
  before_action :set_product_subscriber, only: [:show, :edit, :update, :destroy]

  # GET /product_subscribers
  # GET /product_subscribers.json
  def index
    @product_subscribers = ProductSubscriber.all
  end

  # GET /product_subscribers/1
  # GET /product_subscribers/1.json
  def show
  end

  # GET /product_subscribers/new
  def new
    @product_subscriber = ProductSubscriber.new
  end

  # GET /product_subscribers/1/edit
  def edit
  end

  # POST /product_subscribers
  # POST /product_subscribers.json
  def create
    @product_subscriber = ProductSubscriber.new(product_subscriber_params)

    respond_to do |format|
      if @product_subscriber.save
        format.html { redirect_to @product_subscriber, notice: 'Product subscriber was successfully created.' }
        format.json { render :show, status: :created, location: @product_subscriber }
      else
        format.html { render :new }
        format.json { render json: @product_subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_subscribers/1
  # PATCH/PUT /product_subscribers/1.json
  def update
    respond_to do |format|
      if @product_subscriber.update(product_subscriber_params)
        format.html { redirect_to @product_subscriber, notice: 'Product subscriber was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_subscriber }
      else
        format.html { render :edit }
        format.json { render json: @product_subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_subscribers/1
  # DELETE /product_subscribers/1.json
  def destroy
    @product_subscriber.destroy
    respond_to do |format|
      format.html { redirect_to product_subscribers_url, notice: 'Product subscriber was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_subscriber
      @product_subscriber = ProductSubscriber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_subscriber_params
      params.require(:product_subscriber).permit(:company_id, :product_price_id, :is_manager, :is_payer)
    end
end

class OrderProductsController < ApplicationController
include CurrentOrder
before_action :set_order_product, only: [:show, :edit, :update, :destroy]
before_action :set_order, only: [:create]

  def index
    @order_products = OrderProduct.all
  end

  def show
  end

  def new
    @order_product = OrderProduct.new
  end

  def edit
  end

  def create
   product = Product.find(params[:product_id])
   @order_product = @order.order_products.build(product: product)

   respond_to do |format|
     if @order_product.save
       format.html { redirect_to @order_product.order,notice: 'Order product was successfully created.' }
       format.json { render action: 'show', status: :created, location: @order_product }
     else
       format.html { render action: 'new' }
       format.json { render json: @order_product.errors, status: :unprocessable_entity }
     end
   end
  end

  
  def update
    respond_to do |format|
      if @order_product.update(order_product_params)
        format.html { redirect_to @order_product, notice: 'Order product was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_product }
      else
        format.html { render :edit }
        format.json { render json: @order_product.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @order_product.destroy
    respond_to do |format|
      format.html { redirect_to order_products_url, notice: 'Order product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
    def set_order_product
      @order_product = OrderProduct.find(params[:id])
    end

    def order_product_params
      params[:order_product]
    end
end

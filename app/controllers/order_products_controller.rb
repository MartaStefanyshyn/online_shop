class OrderProductsController < ApplicationController
  before_action :set_order_product, only: [:show, :edit, :update, :destroy]

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
   @order = current_order
   product = Product.find(params[:product_id])
   @order_product = @order.add_product(product.id)

   respond_to do |format|
     if @order_product.save
       format.html { redirect_to @order_product.order}
       format.json { render action: 'show', status: :created, location: @order_product }
     else
       format.html { render action: 'new' }
       format.json { render json: @order_product.errors, status: :unprocessable_entity }
     end
   end
  end

  
  def update
    @order = current_order
    respond_to do |format|
      if @order_product.update(order_product_params)
        format.html { redirect_to @order }
        format.json { render :show, status: :ok, location: @order_product }
      else
        format.html { render :edit }
        format.json { render json: @order_product.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @order = current_order
    @order_product.destroy
    respond_to do |format|
      format.html { redirect_to @order }
      format.json { head :no_content }
    end
  end

  def minus
    @order = current_order
    @order_product = OrderProduct.find(params[:id])
    if @order_product.amount > 1
        @order_product.amount -=1
        @order_product.save
    elsif @order_product.amount == 1
      @order_product.destroy
    end
   redirect_to @order
  end

  def plus
    @order = current_order
    @order_product = OrderProduct.find(params[:id])
    @order_product.amount +=1
    @order_product.save
    redirect_to @order
  end

  private
  
    def set_order_product
      @order_product = OrderProduct.find(params[:id])
    end

    def order_product_params
      params.require(:order_product).permit(:amount)
    end
end

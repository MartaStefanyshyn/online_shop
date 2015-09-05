class OrdersController < ApplicationController
	before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.all
  end

  
  def show
    @order = current_user.orders.find(params[:id])
  end

  
  def new
    @order = current_user.orders.new
  end

  
  def edit
  end

  
  def create
    @order = current_user.orders.build(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    @order = current_user.orders.find(params[:id])
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @order = current_user.orders.find(params[:id])
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_order
      @order = Order.find(params[:id])
    end

    
    def order_params
      params(:order).permit(:status)
    end
end


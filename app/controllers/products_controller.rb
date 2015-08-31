class ProductsController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!
	  
    def index
      if !user_signed_in?
        redirect_to root_path
      else
	      @products = Product.all
      end
	  end

	  def show
      if !user_signed_in?
        head :forbidden
      else
        @product = Product.find(params[:id])
      end
    end

  
    def new
      if !user_signed_in?
        head :forbidden
      else
        @product = Product.new
        @categories = Category.all
      end  
    end

  
    def edit
      @categories = Category.all
    end

  
    def create
      if current_user.role == "admin"
        @product = current_user.products.build(product_params)
        respond_to do |format|
          if @product.save
            format.html { redirect_to @product, notice: 'Product was successfully created.' }
            format.json { render :show, status: :created, location: @product }
          else
            format.html { render :new }
            format.json { render json: @product.errors, status: :unprocessable_entity }
          end
        end
      else
        head :forbidden
      end
    end

  
    def update
      if current_user.role == "admin"
        @product = current_user.products.find(params[:id])
        respond_to do |format|
          if @product.update(product_params)
            format.html { redirect_to @product, notice: 'Product was successfully updated.' }
            format.json { render :show, status: :ok, location: @product }
          else
            format.html { render :edit }
            format.json { render json: @product.errors, status: :unprocessable_entity }
          end
        end
      else
        head :forbidden
      end
    end

  
    def destroy
      if current_user.role == "admin"
        @product = current_user.products.find(params[:id])
        @product.destroy
        respond_to do |format|
          format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
          format.json { head :no_content }
        end
      else
        head :forbidden
      end
    end

    private
    
    def set_product
      @product = Product.find(params[:id])
    end

    
    def product_params
      params.require(:product).permit(:name, :description, :price, :category_id, :user_id, :photo)
    end
end

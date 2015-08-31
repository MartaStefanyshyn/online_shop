class CategoriesController < ApplicationController
	before_action :set_category, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!#:check_authentification, only: [:create, :update, :destroy]

	def index
		if !user_signed_in?
      redirect_to root_path
    else
		  @categories = Category.all
		end
	end

	def show
		if !user_signed_in?
          head :forbidden
        else
         @category = Category.find(params[:id])
        end
	end

	def new
		if !user_signed_in?
          head :forbidden
        else
		  @category = Category.new
		end
	end

	def create
		if current_user.role == "admin"
		  @category = current_user.categories.build(category_params)
          respond_to do |format|
          if @category.save
            format.html { redirect_to @category, notice: 'Category was successfully created.' }
            format.json { render :show, status: :created, location: @category }
          else
            format.html { render :new }
            format.json { render json: @category.errors, status: :unprocessable_entity }
          end
         end
        else
         head :forbidden
       end
	end

    def update
      if current_user.role == "admin"
		 @category = current_user.categories.find(params[:id])
         respond_to do |format|
        if @category.update(category_params)
          format.html { redirect_to @category, notice: 'Category was successfully updated.' }
          format.json { render :show, status: :ok, location: @category }
        else
          format.html { render :edit }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
  else
  	head :forbidden
       end
    end

    def destroy
    if current_user.role == "admin"
       @category = current_user.categories.find(params[:id])
       @category.destroy
       respond_to do |format|
        format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
        format.json { head :no_content }
      end
  else
  	head :forbidden
     end
    end

    private
    
    def set_category
      @category = Category.find(params[:id])
    end

   
    def category_params
      params.require(:category).permit(:title)
    end

end

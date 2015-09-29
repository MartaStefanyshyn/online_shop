class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    @order = current_user.orders.find_by(state: "active")
    if @order 
      @order
    else
      @order = current_user.orders.create
      @order
    end
  end
end

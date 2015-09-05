module CurrentOrder
 extend ActiveSupport::Concern
 private
 def set_order
      @order = current_user.orders.find(session[:order_id])
      rescue ActiveRecord::RecordNotFound
      @order = current_user.orders.create
      session[:order_id] = @order.id
 end
end
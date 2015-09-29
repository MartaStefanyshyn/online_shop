module CurrentOrder
 extend ActiveSupport::Concern
 private
 def set_order
    @order = current_user.orders.find_by(state: "active")
    rescue ActiveRecord::RecordNotFound
    @order = current_user.orders.create
    @order
 end
end
class Order < ActiveRecord::Base
 after_initialize :set_default_state, :if => :new_record?
  
  def set_default_state
    self.state = "active"
  end

  def add_product(product_id)
     current_item = order_products.find_by(product_id: product_id)
     if current_item
       current_item.amount += 1
     else
       current_item = order_products.build(product_id: product_id)
     end
     current_item
  end
  has_many :order_products, dependent: :destroy
  belongs_to :user
end

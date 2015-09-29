class OrderProduct < ActiveRecord::Base
	belongs_to :product
    belongs_to :order

    def total_price
      product.price * amount
    end
end

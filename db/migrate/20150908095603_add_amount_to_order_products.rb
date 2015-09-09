class AddAmountToOrderProducts < ActiveRecord::Migration
  def change
    add_column :order_products, :amount, :integer, default: 1
  end
end

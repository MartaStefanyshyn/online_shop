class Order < ActiveRecord::Base
 after_initialize :set_default_state, :if => :new_record?

  def set_default_state
    self.state = "active"
  end
  has_many :order_products, dependent: :destroy
  belongs_to :user
end

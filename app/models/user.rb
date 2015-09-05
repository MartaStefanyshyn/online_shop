class User < ActiveRecord::Base
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role = "user"
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :categories
  has_many :products  
  has_many :orders, dependent: :destroy    
end

class Category < ActiveRecord::Base
	belongs_to :users
	has_many :products, dependent: :destroy
	validates :title, presence: true
	#validates_associated :products
end

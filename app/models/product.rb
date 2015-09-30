class Product < ActiveRecord::Base
	belongs_to :users
	belongs_to :category
	has_many :order_products
	has_attached_file :photo#, styles:{ large:"600x600>", medium: "300x300>", thumb: "100x100#"}
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
	validates :name, :description, :price, presence: true
	validates :price, numericality: { greater_than_or_equal_to: 0.5 }

	# define_index do
	# 	indexes content
	# 	indexes :name, sortable: true
	# end
end

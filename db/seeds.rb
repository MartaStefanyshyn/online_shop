# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
categories = Category.create([{ title: 'Shoes' }, { title: 'Clothes' }, { title: 'Bags' }])
Product.create!(name: "Nike Air Max", 
	           description: "Women`s running shoe", 
	           price: 255, 
	           category_id: 35, 
	           photo_file_name: "nike.jpg", 
	           photo_content_type: "image/jpeg",
	           photo_file_size: 4,
	           photo_updated_at: "",
	           user_id: 1)
Product.create!(name: "Louboutin`s Pigalle ", 
	           description: "Women`s shoe, 120 mm", 
	           price: 675, 
	           category_id: 35, 
	           photo_file_name: "louboutin.jpg", 
	           photo_content_type: "image/jpeg",
	           photo_file_size: 4,
	           photo_updated_at: "",
	           user_id: 1)
Product.create!(name: "Jeans ", 
	           description: "Women`s jeans", 
	           price: 150, 
	           category_id: 36, 
	           photo_file_name: "jeans.jpg", 
	           photo_content_type: "image/jpeg",
	           photo_file_size: 4,
	           photo_updated_at: "",
	           user_id: 1)
Product.create!(name: "T-shirt ", 
	           description: "Women`s t-shirt", 
	           price: 100, 
	           category_id: 36, 
	           photo_file_name: "t-shirt.jpg", 
	           photo_content_type: "image/jpeg",
	           photo_file_size: 4,
	           photo_updated_at: "",
	           user_id: 1)
Product.create!(name: "Jacket ", 
	           description: "Women`s Jacket", 
	           price: 100, 
	           category_id: 36, 
	           photo_file_name: "jacket.jpg", 
	           photo_content_type: "image/jpeg",
	           photo_file_size: 4,
	           photo_updated_at: "",
	           user_id: 1)
Product.create!(name: "Pullover ", 
	           description: "Women`s pullover", 
	           price: 100, 
	           category_id: 36, 
	           photo_file_name: "pullover.jpg", 
	           photo_content_type: "image/jpeg",
	           photo_file_size: 4,
	           photo_updated_at: "",
	           user_id: 1)
Product.create!(name: "Chanel Bag", 
	           description: "Women`s large flap bag", 
	           price: 100, 
	           category_id: 37, 
	           photo_file_name: "bag_1.jpg", 
	           photo_content_type: "image/jpeg",
	           photo_file_size: 4,
	           photo_updated_at: "",
	           user_id: 1)
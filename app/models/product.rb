class Product < ApplicationRecord
	belongs_to :category
	delegate :name, :to => :category, :prefix => true, :allow_nil => true
	has_many :order_items 
	has_many :replenishes
end



class ReplenishesController < ApplicationController

	def new

		@products = Product.where( "safetystock >= instock")
		
	end


	
	def create

		@products = Product.where( "safetystock >= instock")
		@products.each do |product|
			@replenish = Replenish.new
			params[:add].each do |key,value|
				if product.id == key.to_i
					@replenish.add = value.to_i
					@replenish.product_id = product.id
					@replenish.save
				end
			end
			product.instock = product.instock + @replenish.add
			product.save
		end
	end

end






		

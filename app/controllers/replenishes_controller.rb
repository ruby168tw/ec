class ReplenishesController < ApplicationController

	def new

		@products = Product.where( "safetystock >= instock")

		p "aaa"
		p @products
		p "bbb"

		@replenish = Replenish.new
	end


	
	def create

		@products = Product.where( "safetystock >= instock")
		@replenish = Replenish.new(replenish_params)
		@replenish.save

		#p "ccc"
		#p @product
		#p "ddd"
		#p @products
		#p "eee"
		#p @product.instock
		#p "fff"
		#p @products.instock
		#p "ggg"

		@products.each do |product|
			@instock = product.instock
			@instock = product.instock + @replenish.replenish
			@instock.update
		end

		
	end

	private

	def replenish_params
    	params.require(:replenish).permit(:product_id, :replenish)
    end

    def product_params
    	params.require(:product).permit(:instock, :name, :safetystock)
    end

end








		

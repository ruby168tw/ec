class ReplenishesController < ApplicationController

	def new
		@replenish = Replenish.new
		@product = Replenish.find_by(params[:product_id])
	end

	def create
		@replenish = Replenish.new
		@instock = Product.find_by(id, params[:id]).instock.to_s + @replenish.to_s
		@instock.save
		@replenish.save
	end
end

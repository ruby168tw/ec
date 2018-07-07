class OrdersController < ApplicationController

	def new
		@order = Order.new
			end

	def create
		@order = Order.new(order_params)
		
		@order.save

           @order_item = OrderItem.new
		   @order_item.order_item_save


		  redirect_to orders_path, notice: "完成結帳!"
		
	end








	private

	def order_params
    	params.require(:order).permit(:sn, :user_id, :name, :phone, :address, :paid_status, :shipping_status)
    end

    
end

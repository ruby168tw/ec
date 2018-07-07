class OrderItem < ApplicationRecord
	belongs_to :order
	belongs_to :product
    
    def order_item_save
    	@order_item = OrderItem.new
    	p session[:cart]
        @order_item.product_id = current_cart.items.product.find(params [:id])
    	@order_item.amount = current_cart.items.quantity
       	@order_item.price =  current_cart.items.price
        @order_item.save
    end

end

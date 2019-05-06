class OrdersController < ApplicationController

	def index
        @orders = Order.page(params[:page]).per(5)
    end

    def show
    	@order = Order.find(params[:id])
    	@order_items = Order.find(params[:id]).order_items
    end

    

	def new
		@order = Order.new
	end


	def create
		@order = Order.new(order_params)
		
		
		@order.save
	

        
        current_cart.items.each do |item|
    	@order_item = OrderItem.new
    	@order_item.product_id = item.product_id
    	@order_item.productname = item.product.name
    	@order_item.amount = item.quantity
    	@order_item.price =  item.price
       	@order_item.order_id = @order.id
       	    
        @order_item.save
		
		@product = Product.find_by(:id => @order_item.product_id)
		p "*****"
		p @product
		p "*****"
		p @product.instock
		@product.instock = @product.instock - @order_item.amount
		p "*****"
		p @product.instock
		@product.save
		
		end


        
        
        session[Cart::SessionKey] = nil


		  redirect_to orders_path, notice: "完成結帳!"
		
	end








	private

	def order_params
    	params.require(:order).permit(:sn, :user_id, :buyer, :phone, :address, :paid_status, :shipping_status)
	end
	
	def product_params
		params.require(:product).permit(:id, :instock)
	end

    
end

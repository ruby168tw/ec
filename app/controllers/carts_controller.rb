class CartsController < ApplicationController

	#建立購物車
	def add
		#將session內容(Hash格式)還原回購物車內容後的值傳至cart此instance
		#from_hash此方法在Cart.rb中
		#cart = Cart.from_hash(session[Cart::SessionKey])
		#以上這行code不需要，因為已被寫到Cartshelper中
		#原因是其它 Controller 也可能需要取用購物車的內容，因此這裡採用寫在helper中，並須被include到application_controller.rb中


		#增加item至cart中，增加方式為經由傳入product的id
		#add_item此方法在cart.rb中
		current_cart.add_item(params[:id])
		#將購物車的內容存回session裡
		#serialize此方法在cart.rb中
		session[Cart::SessionKey] = current_cart.serialize

		redirect_to product_index_path, notice: "#{Product.find(params[:id]).name} 已加入購物車"
	end

    #清空購物車
	def destroy
		session[Cart::SessionKey] = nil
		redirect_to product_index_path, notice: "購物車已清空"
	end

end

module CartsHelper

	#from_hash此方法在cart.rb中
	def current_cart
		@cart ||= Cart.from_hash(session[Cart::SessionKey])
	end

end

class CartItem
	attr_reader :product_id, :quantity

	#初始化，使每個CartItem中的instance產生時，都帶有product_id和quantity的屬性，且quantity的預設值為1
	def initialize(product_id, quantity = 1)
		@product_id = product_id
		@quantity = quantity
	end
    
    #此方法在Cart中被呼叫
	def increment(n = 1)
		# @quantity += n等同於 @quantity = @quantity + n
		@quantity += n
	end
    
    #找product
	def product
		Product.find_by(id: product_id)
	end

	#計算product的個別總金額
	def price
		product.price * quantity
	end


end
class Cart
	SessionKey = :cart9487

	attr_reader :items

    #初始化空的item陣列
	def initialize(items = [])
		@items = items
	end

    #在Cart中加入item
	def add_item(product_id)
		#found_item = items找尋item參數，透過product_id此方法
		found_item =items.find{|item| item.product_id == product_id}

        #若found_item被傳回的值在Cart中已有，則直接增加
        #incrment此方法寫在CartItem裡
		if found_item
			found_item.increment

		#若沒有，則直接在CartItem中，以傳入product_id的方式新增一個，塞進@items陣列中	
		else
			@items << CartItem.new(product_id)
		end
	end
    
    #確認items陣列是否為empty
	def empty?
		items.empty?
	end
    
    #結算總金額
    #reduce用法 參考http://lazybios.com/2015/11/once-understand-inject-reduce/
	def total_price
		#price此方法在CartItem.rb中
		items.reduce(0) {|sum, item| sum + item.price}
	end

	#因為預計會使用 Session 存購物車的資料，所以會需要把購物車物件轉換成 Hash 格式
	#(把 Session 的內容（Hash 格式），還原成購物車的內容)
	#map用法 參考https://blog.csdn.net/XIAO_XIAO_C/article/details/77447940
	def serialize
		all_items = items.map{ |item|
			{"product_id" => item.product_id, "quantity" =>item.quantity}
		}

		{"items" => all_items}
	end

	#把存放在 Session 的內容（Hash 格式），還原成購物車的內容
	def self.from_hash(hash)
		if hash.nil?
			new []
		else
			new hash["items"].map { |item_hash|
				CartItem.new(item_hash["product_id"], item_hash["quantity"])

			}
		end
	end

end
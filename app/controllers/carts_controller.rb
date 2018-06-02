class CartsController < ApplicationController
	def add
      current_cart.add_item(params[:id])
      session[:cart9487] = current_cart.serialize

      redirect_to product_path, notice: "已加入購物車"
    end

    def destroy
      session[:cart9487] = nil
      redirect_to cart_path, notice: "已結帳"
    end
end

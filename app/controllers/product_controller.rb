class ProductController < ApplicationController
	def index
  @product = Product.page(params[:page]).per(5)
end
end

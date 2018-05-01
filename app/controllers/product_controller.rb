class ProductController < ApplicationController
	before_action :set_product, :only => [ :show, :edit, :update, :destroy]

	def index
  @product = Product.page(params[:page]).per(5)
end

def show
    @page_title = @product.name
	end


private

    def set_product
  @product = Product.find(params[:id])
end
end

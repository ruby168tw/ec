class ProductController < ApplicationController
	before_action :set_product, :only => [ :show, :edit, :update, :destroy]
    before_action :authenticate_member!, except: [:index, :show]
	def index
  @product = Product.page(params[:page]).per(5)
end

def show
    @page_title = @product.name
	end

def new
	@product = Product.new
end

def create
	@product = Product.new(product_params)

	if @product.save
		#成功
		redirect_to product_index_path, notice: "新增產品成功"
	else
		#失敗
		render :new
	end
end

def motify
	@product = Product.category

	@product.save
		#成功
	redirect_to categories_path, notice: "更新分類成功"
end


def edit
	@product = Product.find_by(id: params[:id])
end

def update
	@product = Product.find_by(id: params[:id])

	if @product.update(product_params)
		#成功
		redirect_to product_index_path, notice: "更新產品成功"
	else
		render :edit
	end
end

def destroy
	@product = Product.find_by(id: params[:id])
	@product.destroy
	redirect_to product_index_path, notice: "產品已刪除"
end

private

    def set_product
  @product = Product.find(params[:id])
end

    def product_params
    	params.require(:product).permit(:name, :price, :description, :category_id)
    end

end

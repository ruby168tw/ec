class CategoriesController < ApplicationController
	before_action :set_categories, :only => [ :show, :edit, :update, :destroy]
    
	def index
  @categories = Category.page(params[:page]).per(5)
end

def show
    @page_title = @categories.name
	end

def new
	@categories = Category.new
end

def create
	@categories = Category.new(categories_params)

	if @categories.save
		#成功
		redirect_to categories_path, notice: "新增分類成功"
	else
		#失敗
		render :new
	end
end

def edit
	@categories = Category.find_by(id: params[:id])
end

def update
	@categories = Category.find_by(id: params[:id])

	if @categories.update(categories_params)
		#成功
		redirect_to categories_path, notice: "更新分類成功"
	else
		render :edit
	end
end

def destroy
	@categories = Category.find_by(id: params[:id])
	@categories.destroy
	redirect_to categories_path, notice: "分類已刪除"
end

def load_product_name
	request.product.all
end

private

    def set_categories
  @categories = Category.find(params[:id])
end

    def categories_params
    	params.require(:category).permit(:name)
    end

end

class CategoriesController < ApplicationController
	before_action :set_category, :only => [ :show, :edit, :update, :destroy]
	
    
	def index
  @category = Category.page(params[:page]).per(5)
end

def show
    @page_title = @category.name
    @products = @category.products
    p "testestsetstse"  
end

def new
	@category = Category.new
end

def create
	@category = Category.new(categories_params)

	if @category.save
		#成功
		redirect_to categories_path, notice: "新增分類成功"
	else
		#失敗
		render :new
	end
end

def edit
	@category = Category.find_by(id: params[:id])
end

def update
	@category = Category.find_by(id: params[:id])

	if @category.update(categories_params)
		#成功
		redirect_to categories_path, notice: "更新分類成功"
	else
		render :edit
	end
end

def category_update
	@category = Category.find_by(id: params[:id])

	@category.update(categories_params)
		#成功
		redirect_to categories_path, notice: "更新分類成功"
end

def destroy
	@category = Category.find_by(id: params[:id])
	@category.destroy
	redirect_to categories_path, notice: "分類已刪除"
end

private

    def set_category
  @category = Category.find(params[:id])
end

    def categories_params
    	params.require(:category).permit(:name)
    end

  
end

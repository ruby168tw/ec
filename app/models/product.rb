class Product < ApplicationRecord
	before_action :set_product, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_member!, except: [:index, :show]
end

def index
	@product = Product.paginate(:page => params[:page], per_page: 5)
end

def show
end

def new
end

def edit
end

def create
end

def update
end


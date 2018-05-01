class UserController < ApplicationController
	
	before_action :set_user, :only => [ :show, :edit, :update, :destroy]
    
	def index
  @user = User.page(params[:page]).per(5)
end

def show
    @page_title = @user.name
	end

def new
	@user = User.new
end

def create
	@user = User.new(user_params)

	if @user.save
		#成功
		redirect_to user_index_path, notice: "新增會員成功"
	else
		#失敗
		render :new
	end
end

def edit
	@user = User.find_by(id: params[:id])
end

def update
	@user = User.find_by(id: params[:id])

	if @user.update(user_params)
		#成功
		redirect_to user_index_path, notice: "更新會員成功"
	else
		render :edit
	end
end

def destroy
	@user = User.find_by(id: params[:id])
	@user.destroy
	redirect_to user_index_path, notice: "會員已刪除"
end

private

    def set_user
  @user = User.find(params[:id])
end

    def user_params
    	params.require(:user).permit(:name, :email, :password)
    end

end

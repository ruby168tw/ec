class MemberController < ApplicationController
	
	before_action :set_member, :only => [ :show, :edit, :update, :destroy]
    
	def index
  @member = Member.page(params[:page]).per(5)
end

def show
    @page_title = @member.name
	end

def new
	@member = Member.new
end

def create
	@member = Member.new(member_params)

	if @member.save
		#成功
		redirect_to member_index_path, notice: "新增管理者成功"
	else
		#失敗
		render :new
	end
end

def edit
	@member = Member.find_by(id: params[:id])
end

def update
	@member = Member.find_by(id: params[:id])

	if @member.update(member_params)
		#成功
		redirect_to member_index_path, notice: "更新管理者成功"
	else
		render :edit
	end
end

def destroy
	@member = Member.find_by(id: params[:id])
	@member.destroy
	redirect_to member_index_path, notice: "管理者已刪除"
end

private

    def set_member
  @member = Member.find(params[:id])
end

    def member_params
    	params.require(:member).permit(:name, :email, :password)
    end

end

class UsersController < ApplicationController
	#usr find method is calling every time when function call
	before_action :set_user,only: [:edit,:update,:show,:destroy]
	def index
		@users = User.paginate(page: params[:page], per_page: 2)
	end
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "wellcome to the alpha blog #{@user.username}"
			redirect_to articles_path
		else
			render 'new'
		end
	end

	def edit
		# this method call above first time when start -> @user = User.find(params[:id])
	end
	def update
		# this method call above first time when start -> @user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "Your Profile was Updated Successfully"
			redirect_to articles_path
		else
			render 'edit'
		end
	end

	def show
		# this method call above first time when start -> @user = User.find(params[:id])
		@users_articles = @user.articles.paginate(page: params[:page], per_page: 2)
	end

	def destroy
		#this method calls above -> @article = Article.find(params[:id])
		@user.destroy
		flash[:danger]="User was successfully Deleted"
		redirect_to articles_path
	end

	private
	def user_params
		params.require(:user).permit(:username,:email,:password)
	end

	def set_user
			@user = User.find(params[:id])
	end
end
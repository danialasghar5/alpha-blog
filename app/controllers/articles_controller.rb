class ArticlesController < ApplicationController
	#article find method is calling here first time before any action
	before_action :set_article, only: [:edit,:update,:show,:destroy]

	#index action method
	def index
		@articles = Article.all
	end

	#new action method
	def new
		@article = Article.new
	end

	#create action method
	def create
		#render plain: params[:article].inspect
		@article = Article.new(article_params)
		@article.user = User.first
		if @article.save
			flash[:success] = "Article Was Successfully Created"
			redirect_to article_path(@article)
		else
			render 'new'
		end
	end

	#edit action method
	def edit
		#this method calls above -> @article = Article.find(params[:id])
	end

	#update action method
	def update
		#this method calls above -> @article = Article.find(params[:id])
		if @article.update(article_params)
			flash[:success]= "Article was successfully Updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	#delete action method
	def destroy
		#this method calls above -> @article = Article.find(params[:id])
		@article.destroy
		flash[:danger]="Article was successfully Deleted"
		redirect_to articles_path
	end

	#show action method
	def show
		#this method calls above -> @article = Article.find(params[:id])
	end

	private
		def set_article
			@article = Article.find(params[:id])
		end
		def article_params
			params.require(:article).permit(:title,:description)
		end
end
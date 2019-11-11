class ArticlesController < ApplicationController
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
		if @article.save
			flash[:notice] = "Article Was Successfully Created"
			redirect_to article_path(@article)
		else
			render 'new'
		end
	end

	#edit action method
	def edit
		@article = Article.find(params[:id])
	end

	#update action method
	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			flash[:notice]= "Article was successfully Updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	#show action method
	def show
		@article = Article.find(params[:id])
	end

	private
		def article_params
			params.require(:article).permit(:title,:description)
		end
end
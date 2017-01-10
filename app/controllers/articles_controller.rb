class ArticlesController < ApplicationController
  
  # Get the article before the listed methods start
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  
  def new
    @article = Article.new
  end
  
  def index
    @articles = Article.all
    
  end
  
  def edit
    
  end
  
  def update
    if @article.update(article_params)
      flash[:success] = "Article was sucessfully updated."
      redirect_to article_path(@article)
    else
      render "edit"
    end
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      #render plain: params[:article].inspect
      flash[:success] = "Article was sucessfully created."
      redirect_to article_path(@article)
    else
      render "new"
    end
  end
   
  def show
    
  end
  
  def destroy
    
    @article.destroy
    flash[:danger] = 'Articles was sucessfully deleted'
    redirect_to articles_path
  end
  
   
  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
    
    def set_article
      @article = Article.find(params[:id])
    end
end
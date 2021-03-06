class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :destroy, :edit, :update]


  def index
    @articles = Article.all
  end

  def show
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
    flash.notice = "You've created an article"
  end

  def edit
  end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
    flash.notice = "Article #{@article.title} updated!"
  end

  def destroy
    @article.destroy
    redirect_to articles_path
    flash.notice = "Article has been deleted"
  end





private

  def article_params
    params.require(:article).permit(:title, :body, :tag_list)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end

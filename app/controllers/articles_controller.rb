class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
    #obviated by before_action    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    # Essentially declaring a variable for the .html.erb file
    @article = Article.new
  end

  def edit
    #obviated by before_action    @article = Article.find(params[:id])
  end

  def create
    # params.require(:article) means that 'article' must appear in the parameters list for it to work
    # permit(:title, :description) means that only title and description will be set upon creation
    @article = Article.new(strong_parameters)

    # Temporary fix until proper solution has been written:
    @article.user = User.first

    if @article.save
      flash[:notice] = "Article has been saved"
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    #obviated by before_action    @article = Article.find(params[:id])

    if @article.update(strong_parameters)
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    #obviated by before_action    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def strong_parameters 
    params.require(:article).permit(:title, :description)
  end

end

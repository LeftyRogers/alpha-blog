class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    # Essentially declaring a variable for the .html.erb file
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    # params.require(:article) means that 'article' must appear in the parameters list for it to work
    # permit(:title, :description) means that only title and description will be set upon creation
    @article = Article.new(params.require(:article).permit(:title, :description))

    if @article.save
      flash[:notice] = "Article has been saved"
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

end

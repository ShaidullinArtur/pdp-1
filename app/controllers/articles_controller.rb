class ArticlesController < ApplicationController
  expose(:articles)
  expose_decorated(:article, attributes: :article_params)

  before_action :authorize_article, only: %i(edit update destroy)

  def index
    self.articles = Article.includes(:author).order(created_at: :desc).page(params[:page]).decorate
  end

  def create
    article.author = current_user
    article.save
    respond_with article
  end

  def update
    article.save
    respond_with article
  end

  def destroy
    article.destroy
    respond_with article
  end

  private

  def authorize_article
    authorize article
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end
end

class ArticleDecorator < ApplicationDecorator
  delegate :id, :created_at, :title, :text, :author
  delegate :full_name, to: :author, prefix: true

  private :author

  def recent_comments
    object.comments.includes(:user).order(created_at: :desc)
  end
end

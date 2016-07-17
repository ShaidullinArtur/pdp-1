class ArticleDecorator < ApplicationDecorator
  delegate :id, :created_at, :title, :text, :author
  delegate :full_name, to: :author, prefix: true

  private :author
end

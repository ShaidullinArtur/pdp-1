class CommentDecorator < ApplicationDecorator
  delegate :id, :text, :user

  def created_at
    I18n.l(object.created_at, format: :us_date)
  end
end

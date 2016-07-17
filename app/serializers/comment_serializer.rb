class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :created_at

  has_one :user

  def created_at
    I18n.l(object.created_at, format: :us_date)
  end
end

class Article < ActiveRecord::Base
  validates :title, :text, :author, presence: true

  belongs_to :author, class_name: "User", foreign_key: :user_id

  has_many :comments, dependent: :destroy
end

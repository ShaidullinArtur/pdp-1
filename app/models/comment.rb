class Comment < ActiveRecord::Base
  validates :text, :user, :article, presence: true

  belongs_to :user
  belongs_to :article, counter_cache: true
end

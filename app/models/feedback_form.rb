class FeedbackForm
  include ActiveModel::Model
  attr_accessor :email, :text

  validates :email, :text, presence: true
  validates :email, format: Devise.email_regexp

  def attributes=(attributes = {})
    attributes.each do |key, value|
      send("#{key}=", value)
    end
  end

  def persisted?
    false
  end

  def self.model_name
    @model_name ||= ActiveModel::Name.new(self, nil, "Feedback")
  end
end

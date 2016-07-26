class SendFeedback
  include Interactor

  delegate :feedback_form, to: :context
  delegate :email, :text, to: :feedback_form

  def call
    context.fail! unless feedback_form.valid?
    FeedbackMailer.feedback(email, text).deliver
  end
end

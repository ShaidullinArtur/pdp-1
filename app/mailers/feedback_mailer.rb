class FeedbackMailer < ActionMailer::Base
  def feedback(email, text)
    @email = email
    @text = text

    mail(
      to: ENV["MAILER_RECEIVER_ADDRESS"],
      subject: I18n.t("mailers.feedback.subject")
    )
  end
end

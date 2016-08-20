class FeedbackMailer < ActionMailer::Base
  def feedback(email, text)
    @email = email
    @text = text

    mail(
      to: ENV.fetch("MAILER_RECEIVER_ADDRESS", "no-reply@example.org"),
      subject: I18n.t("mailers.feedback.subject")
    )
  end
end

class FeedbackMailer < ActionMailer::Base
  default from: "no-reply@gogreenride.com"

  def feedback(email, text)
    @email = email
    @text = text

    mail(
      to: ENV["MAILER_RECEIVER_ADDRESS"],
      subject: I18n.t("mailers.feedback.subject")
    )
  end
end

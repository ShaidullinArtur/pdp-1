class FeedbackController < ApplicationController
  expose(:feedback_form, attributes: :feedback_params)

  def new
  end

  def create
    result = SendFeedback.call(feedback_form: feedback_form)
    respond_with result.feedback_form, location: root_path
  end

  private

  def feedback_params
    params.require(:feedback).permit(:email, :text)
  end
end

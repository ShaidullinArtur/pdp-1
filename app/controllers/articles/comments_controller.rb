module Articles
  class CommentsController < ApplicationController
    expose(:article)
    expose(:comments, ancestor: :article)
    expose(:comment, attributes: :comment_params)

    respond_to :json

    def create
      comment.user = current_user
      comment.save
      respond_with comment, location: nil
    end

    private

    def comment_params
      params.require(:comment).permit(:text)
    end
  end
end

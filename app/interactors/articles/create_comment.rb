module Articles
  class CreateComment
    include Interactor

    delegate :article, :comment_params, to: :context

    def call
      build_comment
      comment.save || context.fail!
    end

    private

    def build_comment
      context.comment = article.comments.new(comment_params)
    end
  end
end

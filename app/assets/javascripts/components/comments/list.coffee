class App.CommentsList extends App.Component
  addComment: (comment) =>
    @$el.prepend(@renderComment(comment))

  renderComment: (comment) ->
    JST["comments/item"](comment: comment)

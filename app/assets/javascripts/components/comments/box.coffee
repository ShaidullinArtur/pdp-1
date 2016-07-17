class App.CommentsBox extends App.Component
  refs:
    form: ".comments-form"
    list: ".comments-list"

  initialize: ->
    @_initComponentForm()
    @_initComponentList()

  _initComponentForm: =>
    props =
      onSubmit: @prependComment
    @form = new App.CommentsForm @$refs.form, props

  _initComponentList: =>
    @list = new App.CommentsList @$refs.list

  prependComment: (comment) =>
    @list.addComment(comment)

$ ->
  new App.CommentsBox(".comments")

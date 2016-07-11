class App.CommentsForm extends App.Component
  refs:
    textInput: ".comments-form-text"

  bindings: ->
    @$el.on "submit", @onSubmit

  clearForm: =>
    @$refs.textInput.val("")

  onSubmit: (e) =>
    e.preventDefault()
    $.ajax
      url: @$el.attr('action')
      dataType: "json"
      type: @$el.attr('method')
      data: @$el.serialize()
      success: (comment) =>
        @clearForm()
        @props.onSubmit(comment)

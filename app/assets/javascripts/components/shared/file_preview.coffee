class App.FilePreview extends App.Component
  refs:
    fileInput: "input[type='file']"
    previewContainer: ".js-preview-container"
    clearFile: ".js-clear-file"
    image: ".js-image"
    removeFileCheckbox: ".js-remove-file"

  initialize: ->
    @togglePreviewFields() unless @$refs.image.attr("src")

  bindings: ->
    @$refs.fileInput.change @onFileChange
    @$refs.clearFile.click @onClearFileClick

  onClearFileClick: (e) =>
    e.preventDefault()
    @togglePreviewFields()
    @$refs.fileInput.val("")
    @$refs.removeFileCheckbox.prop("checked", true)

  onFileChange: (event) =>
    file = event.target.files[0]
    return unless file
    url = URL.createObjectURL(file)
    @togglePreviewFields(true)
    @$refs.image.attr("src", url)
    @$refs.removeFileCheckbox.prop("checked", false)

  togglePreviewFields: (show = false) =>
    if show
      @$refs.previewContainer.show()
      @$refs.clearFile.show()
    else
      @$refs.previewContainer.hide()
      @$refs.clearFile.hide()

$ ->
  new App.FilePreview(".js-file-preview")
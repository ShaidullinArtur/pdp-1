class App.Component
  constructor: (el, props = {}) ->
    @refs ?= {}
    @$refs = {}
    @el = el
    @$el = $(el)
    @props = props
    @_initRefs()
    @initialize()
    @bindings()

  initialize: ->
    #template method

  bindings: ->
    #template method

  _initRefs: =>
    @$refs[name] = $(selector, @$el) for name, selector of @refs

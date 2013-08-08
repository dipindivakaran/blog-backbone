Blog.Views.UserSessions ||= {}

class Blog.Views.UserSessions.NewView extends Backbone.View
  template: JST["backbone/templates/user_sessions/new"]

  events:
    "submit #new-user_session": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (user_session) =>
        @model = user_session
        window.location.hash = "/#{@model.id}"

      error: (user_session, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this

Blog.Views.UserSessions ||= {}

class Blog.Views.UserSessions.EditView extends Backbone.View
  template : JST["backbone/templates/user_sessions/edit"]

  events :
    "submit #edit-user_session" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (user_session) =>
        @model = user_session
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this

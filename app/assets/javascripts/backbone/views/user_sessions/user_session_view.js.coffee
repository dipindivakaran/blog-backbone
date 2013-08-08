Blog.Views.UserSessions ||= {}

class Blog.Views.UserSessions.UserSessionView extends Backbone.View
  template: JST["backbone/templates/user_sessions/user_session"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this

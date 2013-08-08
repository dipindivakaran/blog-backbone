Blog.Views.UserSessions ||= {}

class Blog.Views.UserSessions.ShowView extends Backbone.View
  template: JST["backbone/templates/user_sessions/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this

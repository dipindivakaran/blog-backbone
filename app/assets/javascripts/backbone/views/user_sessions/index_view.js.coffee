Blog.Views.UserSessions ||= {}

class Blog.Views.UserSessions.IndexView extends Backbone.View
  template: JST["backbone/templates/user_sessions/index"]

  initialize: () ->
    @options.userSessions.bind('reset', @addAll)

  addAll: () =>
    @options.userSessions.each(@addOne)

  addOne: (userSession) =>
    view = new Blog.Views.UserSessions.UserSessionView({model : userSession})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(userSessions: @options.userSessions.toJSON() ))
    @addAll()

    return this

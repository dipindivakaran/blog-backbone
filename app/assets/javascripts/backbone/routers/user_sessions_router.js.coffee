class Blog.Routers.UserSessionsRouter extends Backbone.Router
  initialize: (options) ->
    @user_sessions = new Blog.Collections.UserSessionsCollection()
    @user_sessions.reset options.userSessions

  routes:
    "new"      : "newUserSession"

  newUserSession: ->
    @view = new Blog.Views.UserSessions.NewView(collection: @user_sessions)
    $("#user_sessions").html(@view.render().el)


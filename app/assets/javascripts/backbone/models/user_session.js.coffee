class Blog.Models.UserSession extends Backbone.Model
  paramRoot: 'user_session'

  defaults:
    email: null
    password: null

class Blog.Collections.UserSessionsCollection extends Backbone.Collection
  model: Blog.Models.UserSession
  url: '/user_sessions'

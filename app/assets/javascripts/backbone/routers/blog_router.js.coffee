class Blog.Routers.BlogsRouter extends Backbone.Router
  initialize: (options) ->
    @posts = new Blog.Collections.PostsCollection()
    @user_sessions = new Blog.Collections.UserSessionsCollection()
    @posts.reset options.posts
    @user_sessions.reset options.user_session

  routes:
    "new"      : "newPost"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"
    "login"        : "login"

  login: ->
    @view = new Blog.Views.UserSessions.NewView(collection: @posts)
    $("#login").html(@view.render().el)

  newPost: ->
    @view = new Blog.Views.Posts.NewView(collection: @posts)
    $("#posts").html(@view.render().el)

  index: ->
    @view = new Blog.Views.Posts.IndexView(posts: @posts)
    $("#posts").html(@view.render().el)

  show: (id) ->
    post = @posts.get(id)

    @view = new Blog.Views.Posts.ShowView(model: post)
    $("#posts").html(@view.render().el)

  edit: (id) ->
    post = @posts.get(id)
    @view = new Blog.Views.Posts.EditView(model: post)
    $("#posts").html(@view.render().el)

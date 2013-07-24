class Blog.Models.Post extends Backbone.Model
  paramRoot: 'post'

  defaults:

class Blog.Collections.PostsCollection extends Backbone.Collection
  model: Blog.Models.Post
  url: '/posts'

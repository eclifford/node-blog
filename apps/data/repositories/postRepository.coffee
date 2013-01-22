mongoose    = require 'mongoose'
CONFIG      = require 'config'
PostSchema  = require '../models/post'

class PostRepository
  constructor: ->
    mongoose.connect "#{CONFIG.database.url}/blog"
    @Post = mongoose.model 'Post', PostSchema

  all: (callback) ->
    @Post
      .find({})
      .sort('-dateCreated')
      .exec (err, posts) ->
        callback(null, posts)

  new: (post, callback) ->
    _post = new @Post()
    _post.title = post.title
    _post.preview = post.preview
    _post.body = post.body 
    _post.author = 'eric'
    _post.save (err) ->
      callback err, _post

  remove: (id, callback) ->
    post = @get id, ->
      post.remove()
      callback null

  get: (id, callback) ->
    @Post.find {_id: id}, (err, post) ->
      callback null, post[0]


module.exports = new PostRepository()
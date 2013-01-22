postRepository = require '../../data/repositories/postRepository'

routes = (app) ->
  
  app.get '/admin/posts', (req, res) ->
    postRepository.all (err, posts) ->
      res.render "#{__dirname}/../views/posts/index",
        title: "Blog Admins"
        posts: posts

  app.get '/admin/posts/new', (req, res) ->
    res.render "#{__dirname}/../views/posts/new",
      title: 'New Post'
      post: new Post()

  app.get '/admin/posts/edit/:id', (req, res) ->
    post = postRepository.get req.params.id, (err, post) ->
      res.render "#{__dirname}/../views/posts/edit",
        title: 'Edit Post'
        post: post

  app.post '/admin/posts/new', (req, res) ->
    postRepository.new req.body.post, (err, post) ->
      res.redirect '/admin/posts'

  app.del '/admin/posts/:id', (req, res) ->
    postRepository.remove req.params.id, (err) ->
      res.json {
        result: "success"
      }

module.exports = routes
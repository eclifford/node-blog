postRepository = require '../data/repositories/postRepository'

routes = (app) ->
  app.get '/', (req, res) ->
    postRepository.all (err, posts) ->
      res.render "#{__dirname}/views/index",
      title: "Blog!"
      md: require("node-markdown").Markdown
      hl: require("highlight").Highlight
      posts: posts

module.exports = routes
web = (app, express) ->
  require("#{__dirname}/routes")(app)

  app.configure ->
    app.use express.static("#{__dirname}/public")

module.exports = web
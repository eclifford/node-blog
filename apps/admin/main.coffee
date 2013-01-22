admin = (app, express) ->
  require("#{__dirname}/routes/default")(app)

  app.configure ->
    app.use express.static("#{__dirname}/public")

module.exports = admin
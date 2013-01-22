#
# Post Schema
#
mongoose = require 'mongoose'
config   = require 'config'
Schema   = require mongoose.Schema

PostSchema = new Schema
  title: String,
  body: String

module.exports = PostSchema

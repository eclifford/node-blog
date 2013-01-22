mongoose    = require 'mongoose'
Schema      = mongoose.Schema

PostSchema = new Schema
  title: String,
  body: String,
  author: String,
  dateCreated:
    type: Date
    default: Date.now
  dateUpdated: 
    type: Date
    default: Date.now

module.exports = PostSchema
#wiki collection
WikiModel     = require('./WikiModel')
module.exports = class WikiList extends Backbone.Collection
  model: WikiModel
  url  : '/wiki'

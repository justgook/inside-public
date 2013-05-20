# class MainRouter extends Backbone.Router
#   routes:
#     '': 'index'

#   index: ->
#     IndexView = require 'modules/wiki/WikiListView'
#     index = new IndexView()
#     index.render().el
wiki = require('/modules/wiki/router')
router =
  wiki: new wiki("wiki")
module.exports = router
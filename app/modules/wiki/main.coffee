Module = require("/lib/module")
module.exports = require("/application").module "Wiki", (Wiki, App, Backbone, Marionette, $, _) ->
  @channel = "wiki"

  Wiki.menu =
    icon: "icon-book"
    text: "Wiki"

  class Router extends Backbone.SubRoute
    routes:
      ""           : "wikiList"
      "create"     : "wikiCreate"
      "edit/:item" : "wikiEdit"
      ":title-:id" : "wikiItem"
    wikiList: ->
      console.log "wikiList"
    wikiItem: (title, id)->
      console.log "wikiItem"
    wikiCreate: ->
      console.log "wikiCreate"
    wikiEdit: ->
      console.log "wikiEdit"
    constructor: ->
      super
      Wiki.menu.prefix = @prefix
      @cid = _.uniqueId "module"
  new Router(@channel)
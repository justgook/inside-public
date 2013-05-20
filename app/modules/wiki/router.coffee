module.exports = class WikiRouter extends Backbone.SubRoute
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
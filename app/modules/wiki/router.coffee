Module = require("/lib/module")
module.exports = class WikiRouter extends Module
  menu:
    icon: "icon-book"
    text: "wiki"
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
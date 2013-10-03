Module = require("/lib/module")
module.exports = class WikiRouter extends Module
  menu:
    icon: "icon-eur"
    text: "Money Planner"
  routes:
    ""           : "list"
  list: ->
    console.log "Money Planner List"

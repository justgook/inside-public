view = require("/modules/constructor/BootView")
view = new view();
module.exports = class ConstructorRouter extends Backbone.SubRoute
  routes:
    "/"           : "choseType"
    ":type"       : "editStart"
  choseType: ->
    $("#main").html(view.render().el)
  editStart: (type) ->
    console.log "2 in"
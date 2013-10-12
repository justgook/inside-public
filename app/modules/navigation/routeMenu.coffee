View     = require("/lib/view")
template = require("./routeMenuTop")

module.exports = class MenuHelper extends View
  template: template
  constructor: (attrs, options) ->
    @setElement attrs.el #idk why it dosent work by defaulf
    @collection = attrs.modules
    @collection.on "change:selected", @setUnsetActiveMenu
    @render()
  getRenderData: ->
    data = @collection.toJSON()
    data: data
  setUnsetActiveMenu: (module, set, options) =>
    # add possibility to add/remove class, and not re-render
    @render() if set
    console.log(arguments)
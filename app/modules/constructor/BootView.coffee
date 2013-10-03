View     = require("/lib/view")
template = require("./templates/props")
PropsCollection = require("./PropsCollection")

module.exports = class BootView extends View
  template: template,
  el: "ul#constructor"
  collection: new PropsCollection,
  startDegrees: 270
  initialize: ->
   @collection.set data?.props
  render: ->
    @el.innerHTML = template({start:@startDegrees, items:@collection.toJSON()})
    return this
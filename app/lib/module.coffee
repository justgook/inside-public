
# Base class for all Modules
module.exports = class Module extends Backbone.SubRoute
  menu:
    icon: "icon-sign-blank"
    text: "Blank"
    subMenu: ->
      [
          icon: "icon-user"
          text: "User Profiles"
        ,
          icon: "icon-cogs"
          text: "Admin Tools"
        ,
          icon: "icon-time"
          text: "Worklog"
        ,
          icon: "icon-road"
          text: "Milestornes"
        ]
  constructor: ->
    Backbone.SubRoute::constructor.apply @, arguments
    @cid = _.uniqueId "module"
  toJSON: ->
    result =
      instance: @
      prefix: @prefix
      cid: @cid
      id: @cid #special get references to it
      menu: @menu
    result.menu.subMenu = _.result(@menu, "subMenu") or []
    result


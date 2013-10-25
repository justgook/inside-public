module.exports = require("/application").module "MoneyPlanner", (MoneyPlanner, MyApp, Backbone, Marionette, $, _) ->
  @channel = "money-planner"
  @menu =
    icon: "icon-eur"
    text: "Money Planner"
    subMenu:
      [
        icon: "icon-eur"
        text: "Money Planner234"
      ,
        icon: "icon-eur"
        text: "Money Planner878"
      ,
        icon: "icon-eur"
        text: "Money Planner87"
      ,
        icon: "icon-eur"
        text: "Money Planner7"
      ,
        icon: "icon-eur"
        text: "Money Planner6456"
      ,
        icon: "icon-eur"
        text: "Money Planner 6"
      ,
        icon: "icon-eur"
        text: "Money Planner5"
      ]

  class Router extends Backbone.SubRoute
    routes:
      "": "test1"
    test1: ->
      console.log "MoneyPlanner.Router.test1"
  new Router(@channel)
  # MoneyPlanner.router = new Router

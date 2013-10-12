require("/application").module "MoneyPlanner", (MoneyPlanner, MyApp, Backbone, Marionette, $, _) ->
  MoneyPlanner.menu =
    icon: "icon-eur"
    text: "Money Planner"

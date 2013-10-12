# Initialize Router
ModulesCollection = require 'ModulesCollection'
menuHelper = require 'helpers/routeMenu'
$ ->

  Module = require("/lib/module")
  wiki = require('/modules/wiki/router')
  moneyPlanner = require('/modules/moneyPlanner/router')
  # init main router logic
  class testSubRoute extends Module
    routes:
      "/"           : "testSubRouteCallBack"
    testSubRouteCallBack: ->
    menu:
      icon: "icon-dashboard"
      text: "Dashboard"
      subMenu: [
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
  class testSubRoute1 extends Module
    menu: icon: "icon-hdd", text: "Servers", subMenu: []
    routes: "/": -> []

  class testSubRoute2 extends Module
    menu: icon: "icon-beaker", text: "Resources", subMenu: []
    routes: "/": -> []

  class testSubRoute3 extends Module
    menu: icon: "icon-bar-chart", text: "Logs", subMenu: []
    routes: "/": -> []


  router = new ModulesCollection [new wiki("wiki"), new moneyPlanner("money"), new testSubRoute(""), new testSubRoute1("servers"), new testSubRoute2("resources"), new testSubRoute3("logs")]
  # init menu helper
  new menuHelper({el: document.querySelector("body>aside>menu"), modules: router})

  # Initialize Backbone History
  Backbone.history.start pushState: yes
  Object.freeze(this) if typeof Object.freeze == 'function'
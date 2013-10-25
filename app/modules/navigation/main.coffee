module.exports = require("/application").module "MenuHelper", (MenuHelper, App, Backbone, Marionette, $, _) ->
  # myCol = []
  # myCol.push

  class MenuHelperView extends Backbone.Marionette.ItemView
    tagName: "li"
    template: require "./itemView"
    initialize: ->
      @model.on "change:active", @render
      super
    onRender: ->
      # console.log @model.toJSON()

  class MenuHelperCollectionView extends Backbone.Marionette.CollectionView
    itemView: MenuHelperView
    tagName: "menu"
    onRender: ->
      # console.log @collection

  class NavigationCollection extends Backbone.Collection
    constructor: ->
      Backbone.history.on "route", @setSelected
      super
    set: (models, options) ->
      newModels = []
      for name, instance of models when instance.menu?
        model = instance.menu
        model.channel = instance.channel
        model.active = false
        newModels.push model
      super(newModels, options)

    @current
    setSelected: (router) =>
      menu = (@where channel:router.prefix)?[0]
      console.log menu
      @current.set active: false if @current?
      menu.set active: true
      @current = menu

  test = new MenuHelperCollectionView collection: new NavigationCollection App.submodules

  # console.log test.collection
  App.navigationRegion.show test

  # console.log (new  itemView: MyItemView, collection: myCol).render().el

  # for module in ['App.submodules']
  console.log test.el


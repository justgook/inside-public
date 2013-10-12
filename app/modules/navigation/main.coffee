require("/application").module "MenuHelper", (MenuHelper, MyApp, Backbone, Marionette, $, _) ->
  # myCol = []
  # myCol.push

  class MenuHelperView extends Backbone.Marionette.ItemView
    tagName: "li"
    template: require "./itemView"
    onRender: ->
      console.log @model.toJSON()

  class MenuHelperCollectionView extends Backbone.Marionette.CollectionView
    itemView: MenuHelperView
    tagName: "ul"
    constructor: ->
      super
    onRender: ->
      # console.log @collection

  test = new MenuHelperCollectionView collection: new Backbone.Collection ({instance:instance, menu: instance.menu} for name, instance of MyApp.submodules when instance.menu?)

  # console.log test.collection
  MyApp.navigationRegion.show(test)

  # console.log (new  itemView: MyItemView, collection: myCol).render().el

  # for module in ['MyApp.submodules']
  console.log test.el

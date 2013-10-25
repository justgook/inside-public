class ModulesCollection extends Backbone.Collection
  set: (models, options) ->
    if Array.isArray models
      models = for module in models
        do (module)=>
          module.on "route", =>
            @setSelected module.cid
          module.toJSON()
    else
      models = models.toJSON()
    Backbone.Collection::set.apply @, arguments
  active: null
  setSelected: (moduleId) ->
    module = @get moduleId
    @active.set selected: false if @active
    module.set selected: true
    @active = module
  constructor: (models, option)->
    super
    document.body.addEventListener "click", (e) ->
      node = e.target if e.target.tagName is "A"
      node = e.target.parentNode if e.target.parentNode.tagName is "A"
      if node
        e.preventDefault()
        fragment = node.getAttribute "href"
        fragment = fragment.slice(1) if fragment?.charAt(0) == "/"
        Backbone.history.navigate fragment, true
module.exports = ModulesCollection
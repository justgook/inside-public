
# Base class for all views
module.exports = class View extends Backbone.View
  # initialize: ->
  #   @render = _.bind this.render, this
  template: ->
  getRenderData: ->
  render: ->
    @$el.html @template @getRenderData()
    @afterRender()
    @
  afterRender: ->
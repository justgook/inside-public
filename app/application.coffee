class Application extends Backbone.Marionette.Application
  initialize: =>

    @on("initialize:after", (options) =>
      Backbone.history.start pushState: yes
      # Freeze the object
      Object.freeze? this
    )

    @addInitializer( (options) =>
      # AppLayout = require 'views/AppLayout'
      # @layout = new AppLayout()
      # @layout.render()
    )

    @addInitializer((options) =>
      document.body.addEventListener "click", (e) ->
        node = e.target if e.target.tagName is "A"
        node = e.target.parentNode if e.target.parentNode.tagName is "A"
        if node
          e.preventDefault()
          fragment = node.getAttribute "href"
          fragment = fragment.slice(1) if fragment?.charAt(0) == "/"
          Backbone.history.navigate fragment, true
    )

    @addRegions
      mainRegion: "#main"
      navigationRegion: "body>aside"
      notificationRegion: "#notafication"

application = new Application
application.initialize()

module.exports = application
##ugly fix

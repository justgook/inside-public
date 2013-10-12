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

    )

    @addRegions
      mainRegion: "#main"
      navigationRegion: "body>aside>menu"
      notificationRegion: "#notafication"

application = new Application
application.initialize()

module.exports = application
##ugly fix

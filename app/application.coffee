class Application extends Backbone.Marionette.Application
  error: (error) =>
    console.log error
  initialize: =>

    @on "initialize:after", (options) =>
      Backbone.history.start pushState: yes
      # Freeze the object
      Object.freeze? this


    @addInitializer (options) =>
      #Socket API
      #TODO move me to submodule
      #eio = Socket
      @socket = eio('ws://localhost');
      # @socket = new WebSocket "ws://localhost:3333/"
      @socket.onmessage = ({data, type}) =>
        try
          data = JSON.parse data
          switch data.message
            when "unauthorized"
              $("body").append require("login")()
              $("#login").on "submit", (e)=>
                e.preventDefault()
                @socket.send JSON.stringify
                  message: "login"
                  name: "a"
                  password: "b"
            when "welcome"
              $("#login").addClass "accept"
              callfunction = ->
                $(".special_login").fadeOut()
              $("#login")[0].addEventListener('webkitTransitionEnd', callfunction, false);
              $("#login")[0].addEventListener('oTransitionEnd', callfunction, false);
              $("#login")[0].addEventListener('transitionend', callfunction, false);
              $("#login")[0].addEventListener('msTransitionEnd', callfunction, false);
              console.log "welcome"
            else
              alert "bbb"
        catch error
          @error error

    @addInitializer (options) =>
      #navigation feature..
      document.body.addEventListener "click", (e) ->
        node = e.target if e.target.tagName is "A"
        node = e.target.parentNode if e.target.parentNode.tagName is "A"
        if node
          e.preventDefault()
          fragment = node.getAttribute "href"
          fragment = fragment.slice(1) if fragment?.charAt(0) == "/"
          Backbone.history.navigate fragment, true

    @addRegions
      mainRegion: "#main"
      navigationRegion: "body>aside"
      notificationRegion: "#notafication"

application = new Application
application.initialize()

module.exports = application



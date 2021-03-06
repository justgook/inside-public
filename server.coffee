require "q"
winston = require "winston"
engine = require "engine.io"


logger = new winston.Logger({
    transports: [
      new winston.transports.Console(colorize:true, timestamp:true, level:"debug")
    ]
})



exports.startServer = (port, path, callback) ->
  #   #http://www.senchalabs.org/connect/
  connect = require 'connect'
  app = connect()
    .use(connect.logger('short'))
    .use(connect.static(path))
    .use (req, res, next)->
      err = new Error('Not Found')
      err.number = 7;
      err.status = 404;
      throw err;
    .use(connect.errorHandler())
  #create HTTP server based and attach connect instance to it
  http = require('http').createServer(app).listen(port)

  #attach created server to engine.io to provide correct behavior of it
  server = engine.attach(http)

  #socket (engine.io) connection handler
  server.on 'connection', (socket) ->
    socket.send "{\"message\":\"unauthorized\"}"
    socket.on 'message', (data) -> logger.debug(data)
    socket.on 'close', ->

  #call Callback to say brunch "server is started"
  callback()




# class DataBaseFactory
#   db: {}
#   constructor: (driver, options) ->
#     Datastore = require driver
#     @db = new Datastore
#   insert: ->
#     @db.insert.apply @db, arguments
#   find: ->
#     @db.find.apply @db, arguments

# exports.startServer = (port, path, callback) ->


#   # https://github.com/louischatriot/nedb
#   db = new DataBaseFactory 'nedb', {filename: './db', autoload: true}
#   server = http.Server(app).listen port
#   socket = new WebSocketServer server, "localhost", port
#   db.insert {a:3,b:4}, -> console.log arguments


#   console.log('Listening on port '+ port);


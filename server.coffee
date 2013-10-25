exports.startServer = (port, path, callback) ->
  #http://www.senchalabs.org/connect/
  connect = require 'connect'
  http = require 'http'
  app = connect()
    .use(connect.logger('short'))
    .use(connect.static(path))
    .use (req, res, next)->
      err = new Error('Not Found')
      err.number = 7;
      err.status = 404;
      throw err;
    .use(connect.errorHandler());

  http.Server(app).listen(port);
  console.log('Listening on port '+ port);
  callback()

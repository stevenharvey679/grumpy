
# Starts a server that emits an event on each request.

http = require 'http'
urlUtils = require 'url'
EventEmitter = require('eventemitter2').EventEmitter2;
eventEmitter = new EventEmitter {
  wildcard: true,
  delimiter: '..',
  maxListeners: 0
}
class Server 
  @startServer: (ip='0.0.0.0', port='1337')->
    http.createServer (req, res) ->
      eventEmitter.emit(req.url, req, res)
    .listen(port, ip)
    console.log "Server running at http://#{ip}:#{port}/"
    return eventEmitter

module.exports = Server
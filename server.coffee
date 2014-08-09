
# Starts a server that emits an event on each request.

http = require 'http'
EventEmitter = require('eventemitter2').EventEmitter2;
eventEmitter = new EventEmitter {
  wildcard: true,
  delimiter: '/',
  maxListeners: 0
}
serverHandler = (req, res)->
									url = req.url[1..req.url.length]
									if eventEmitter.listeners(url).length > 0
      							eventEmitter.emit(url, req, res)
									else
										eventEmitter.emit('404', req, res)

class Server 
  @startServer: (ip='0.0.0.0', port='1337')->
    http.createServer(serverHandler).listen(port, ip)
    console.log "Server running at http://#{ip}:#{port}/"
    return eventEmitter

module.exports = Server

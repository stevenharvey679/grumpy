
# Starts a server that emits an event on each request.

http = require 'http'
events = require('events')
eventEmitter = new events.EventEmitter()
urlUtils = require 'url'
serverHandler = (req, res)->
									parsedUrl = urlUtils.parse(req.url, true)
									query = parsedUrl.query
									url = parsedUrl.pathname[1..req.url.length]
									if eventEmitter.listeners(url).length > 0
      							eventEmitter.emit(url, query, res, req)
									else
										eventEmitter.emit('404', query, res, req)

class Server 
  @startServer: (ip='0.0.0.0', port='1337')->
    http.createServer(serverHandler).listen(port, ip)
    console.log "Server running at http://#{ip}:#{port}/"
    return eventEmitter

module.exports = Server

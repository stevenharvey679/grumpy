# Starts a server that emits an event on each request.
http = require 'http'
queryParser = require('querystring')
extend = require('util')._extend
EventEmitter2 = require('eventemitter2').EventEmitter2
eventEmitter = new EventEmitter2(
	wildcard: true,
	delimiter: '::',
	maxListeners: 0
)
urlUtils = require 'url'
serverHandler = (req, res)->
	body = ''
	req.on 'data', (chunk)->
		if req.headers['content-type'].indexOf('multipart/form-data') >= 0
			error = "This server does not implement file upload!"
			eventEmitter.emit("#{req.method}::500",error,res,req)
		else
			body += chunk
	req.on 'end', ->
		parsedUrl = urlUtils.parse(req.url, true)
		params = extend(parsedUrl.query, queryParser.parse(body))
		url = "#{req.method}::#{parsedUrl.pathname}"
		if eventEmitter.listeners(url).length > 0
			eventEmitter.emit(url, params, res, req)
		else
			eventEmitter.emit("#{req.method}::404", url, params, res, req)

class Server 
  @startServer: (ip='0.0.0.0', port='1337')->
    http.createServer(serverHandler).listen(port, ip)
    console.log "Server running at http://#{ip}:#{port}/"
    return eventEmitter

module.exports = Server

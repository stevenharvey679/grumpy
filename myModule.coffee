global.server.on ['placeholder'], (req, res)->
  res.writeHead(200, {'Content-Type': 'text/plain'})
  res.end(@event)
	
global.server.on ['404'], (req, res)->
  res.writeHead(404, {'Content-Type': 'text/plain'})
  res.end('That is a 404, mate')

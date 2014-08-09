global.server.on 'placeholder', (params, res, req)->
  res.writeHead(200, {'Content-Type': 'text/plain'})
  res.end(params)
	
global.server.on '404', (params, res, req)->
  res.writeHead(404, {'Content-Type': 'text/plain'})
  res.end('That is a 404, mate')

global.server.on ['placeholder'], (req, res)->
  res.writeHead(200, {'Content-Type': 'text/plain'})
  res.end(req.method)

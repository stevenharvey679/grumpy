global.server.on 'placeholder', (params, res, req)->
  res.renderJSON params, 200
	
global.server.on '404', (params, res, req)->
  res.renderText 'This is not the page you are looking for', 404

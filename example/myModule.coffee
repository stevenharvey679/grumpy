global.server.on ['GET','/placeholder'], (params, res, req)->
  res.renderJSON params, 200
	
global.server.on ['*','404'], (originalUrl, params, res, req)->
	res.renderText "#{originalUrl} is not a valid route. Are you certain it is spelled correctly?", 404

global.server.on ['*', '500'], (error, res, req)->
	res.renderText error, 500

response = require('http').ServerResponse

response.prototype.renderJSON = (obj = {}, returnCode='200')->
	@writeHead returnCode, {'Content-Type': 'application/json'}
	@end JSON.stringify obj
	
response.prototype.renderText = (text, returnCode='200')->
	@writeHead returnCode, {'Content-Type': 'text/plain'}
	@end text
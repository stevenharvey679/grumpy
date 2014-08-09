# Command tool to start server
argv = require('yargs').argv
if argv.m?
	path = require 'path'
	require '../libs/response'
	global.server = require('../libs/server').startServer(argv.i, argv.p)
	require path.join(process.cwd(), argv.m)
else
	console.log 'A module file is required. Please specify one using the -m flag'
	console.log 'For more information, see documentation'

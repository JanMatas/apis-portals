var express = require('express');
var bodyParser = require('body-parser');
var app = express();
var config = require('./config')

//Middleware
app.use(require('./auth')); //Authetification middleware
app.use(bodyParser.json()); //JSON request parsing

//Routing Connections

//Index
app.use('/', require('./controllers/static')); //Serving html, js, css, data

//API enpoint
app.use('/api/employees', require('./controllers/api/emp')); // Endpoint for employee profiles
app.use('/api/zones', require('./controllers/api/zones'));  // Endpoint for information about zones
app.use('/api/session', require('./controllers/api/session')); //Authetification endpoint - returns jwt token
app.use('/api/map', require('./controllers/api/map')); //Endpoint for map view - serves information about nodes
app.use('/api/transaction', require('./controllers/api/transactionPortal')); //Endpoint for saving transactions
app.use('/api/positionInfo', require('./controllers/api/positionInfo')); // Endpoint for position of employees

var server = app.listen(config.port, function(){	//Starts the app on given port
	console.log('Server listening on', config.port)  
});
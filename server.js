var express = require('express');
var bodyParser = require('body-parser');
var app = express();
var config = require('./config');
var favicon = require('serve-favicon');
var webSocketServer = require('./websockets');
var port = process.env.PORT || config.port;


app.use(favicon(__dirname + '/assets/favicon.ico'));
//Middleware
app.use(require('./auth')); //Authetification middleware
app.use(bodyParser.json()); //JSON request parsing

//Routing Connections

//Index
app.use('/', require('./controllers/static')); //Serving html, js, css, data

//API enpoint
app.use('/api/employee', require('./controllers/api/emp')); // Endpoint for employee profiles
app.use('/api/zone', require('./controllers/api/zone')); // Endpoint for information about zones
app.use('/api/session', require('./controllers/api/session')); //Authetification endpoint - returns jwt token
app.use('/api/map', require('./controllers/api/map')); //Endpoint for map view - serves information about nodes
app.use('/api/transaction', require('./controllers/api/transactionPortal')); //Endpoint for saving transactions
app.use('/api/positionInfo', require('./controllers/api/positionInfo')); // Endpoint for position of employees
app.use('/api/transaction', require('./controllers/api/transaction'));
app.use('/api/time', require('./controllers/api/time'));
app.use('/api/portal', require('./controllers/api/portal'));
app.use('/api/building', require('./controllers/api/building'));
app.use('/api/department', require('./controllers/api/department'));

// Endpoint for connection with portals

app.use('/api/portal_endpoint', require('./controllers/api/portal_endpoint'));

//Start  node server
var server = app.listen(port, function() { //Starts the app on given port
    console.log('Server listening on', port);
});

//Attach websocket server
webSocketServer.connect(server);
var express = require('express');
var bodyParser = require('body-parser');
var app = express();


//Middleware
app.use(require('./auth'));
app.use(bodyParser.json());

//Routing Connections

//Index
app.use('/', require('./controllers/static'));

//APIs
app.use('/api/employees', require('./controllers/api/emp'));
app.use('/api/zones', require('./controllers/api/zones'));
app.use('/api/session', require('./controllers/api/session'));
app.use('/api/map', require('./controllers/api/map'));


var server = app.listen(3000, function(){
	console.log('Server listening on', 3000)
});
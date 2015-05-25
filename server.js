var express = require('express');
var bodyParser = require('body-parser');
var app = express();

//Routing Connections

//Index
app.use('/', require('./controllers/static'));

//APIs
app.use('/api/employees', require('./controllers/api/emp'));
app.use('/api/zones', require('./controllers/api/zones'));

var server = app.listen(3000, function(){
	console.log('Server listening on', 3000)
});
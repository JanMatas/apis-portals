var express = require('express');
var bodyParser = require('body-parser');

var app = express();

app.use('/', require('./controllers/static'));

var server = app.listen(3000, function(){
	console.log('Server listening on', 3000)
});
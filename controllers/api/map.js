var connection = require('../../db');
var router = require('express').Router();
var jwt =require('jwt-simple')
var db = require('../../db')
var config = require('../../config')


router.get('/', function(req, res, next) {
	if(config.authenticate) {
		if (!req.headers['x-auth']) {
			return res.send(401);
		}
		var token = req.headers['x-auth'];
		var auth = jwt.decode(token, config.secret);
	}

	var query = "SELECT * FROM Zone z where buildingId = " + req.query.buildingID;

	console.log(query)
	
	db.fetchData(query, function(err, zones) {
		query = "SELECT * FROM Portal where buildingId = " + req.query.buildingID;
		console.log(query)
	
		db.fetchData(query, function(err, portals) {
			if(err) {
				return res.send(500, err);
			}
			if (zones == []) {
				return res.send(204)
			}
			return res.json({zones : zones, portals: portals});
		})
			

	})
	

});

module.exports = router
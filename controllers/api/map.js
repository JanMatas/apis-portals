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

router.post('/', function(req, res, next) {
	if(config.auth) {
		if (!req.headers['x-auth']) {
			return res.send(401);
		}
		var token = req.headers['x-auth'];
		var auth = jwt.decode(token, config.secret);
	}
	var nodePositions = req.body.nodePositions
 	console.log(nodePositions)
	for (n in nodePositions) {
		// make sure its a node, not an edge
		if (n < 100000) {
			console.log(nodePositions[n])
			var query = "";
			if (n < 10000) { 
				//its a zone
				query = "UPDATE Zone SET " +
					"map_x=(" + nodePositions[n].x + 
					"), map_y=(" + nodePositions[n].y +
					") WHERE id=" + n;
			} else {
				query = "UPDATE Portal SET " +
					"map_x=(" + nodePositions[n].x + 
					"), map_y=(" + nodePositions[n].y +
					") WHERE id=" + (n - 10000);

			}
			console.log(query);
			db.executeQuery(query, function (err) {
				if (err) {
					console.log(err)
					return res.send(500, err);
				} 
				
			})
		}
	}
	res.send(201)

});




module.exports = router
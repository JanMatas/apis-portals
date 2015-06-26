var connection = require('../../db');
var router = require('express').Router();
var db = require('../../db');
var config = require('../../config');


router.get('/employee', function(req, res, next) {
	if(config.authenticate) {
		if (!req.auth) {
			return res.send(401);
		}
	}

	var query = 
		"SELECT IF(STRCMP(t.direction, 'In'), p.zoneFrom, p.zoneTo) as z " +
		"FROM Transaction t " +
		"JOIN Portal p ON p.id = t.portalId " +
		"where employeeId = " + req.query.empId + " " +
		"ORDER BY timestamp DESC " +
		"LIMIT 1";



	db.fetchData(query, function(err, data) {
		if(err) {
			return res.send(500, err);
		}
		if (data == []) {
			return res.send(204);
		}
		return res.json(data);
	});
});


router.get('/zone', function(req, res, next) {
	if(config.authenticate) {
		if (!req.auth) {
			return res.send(401);
		}
	}

	var query = 
		"SELECT id, firstname, lastname " +
		"FROM   (SELECT e.id, e.firstname, e.lastname,"+
		               "IF(Strcmp(t.direction, 'Out'), p.zoneTo, p.zoneFrom) AS "+
		               "currentZone "+
		        "FROM   Employee e "+
		               "INNER JOIN Transaction t "+
		                       "ON t.id = (SELECT t.id "+
		                                  "FROM   Transaction t "+
		                                  "WHERE  t.employeeId = e.id "+
		                                  "ORDER  BY timestamp DESC "+
		                                  "LIMIT  1) "+
		               "INNER JOIN Portal p "+
		                       "ON t.portalId = p.id) AS emp_zone "+
		"WHERE  currentZone = " + req.query.zoneId;

	db.fetchData(query, function(err, data) {
		if(err) {
			return next( err);
		}
		if (data == []) {
			return res.send(204);
		}
		return res.json(data);
	});
});

module.exports = router;
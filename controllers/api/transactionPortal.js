var router = require('express').Router();
var db = require('../../db');
var val = 0;
var util = require('util');

router.post('/', function (req, res, next) {
	var t = req.body.transaction;
	db.connection(function (err, connection) {
		if (err) {
			connection.release();
			next(err);
		}
		connection.on('error', function (err) {
			connection.release();
			next(err);
		});

		query = "SELECT IF(STRCMP(t.direction, 'In'), p.zoneFrom, p.zoneTo) as zone ,"+
					" UNIX_TIMESTAMP(timestamp) as timestamp" + 
		    	" FROM Transaction t JOIN Portal p ON t.portalId = p.id" +
				" WHERE timestamp <= FROM_UNIXTIME(" + t.timestamp / 1000 + ")"+
				" AND employeeId = "  + t.employeeId + " ORDER BY timestamp Desc LIMIT 1";

		connection.query(query, function (err, lastTrans) {
			if (err) {
				connection.release();
				return next(err);
			}
			if (t.direction == "In") {
				query = "SELECT zoneFrom as zone FROM Portal WHERE id = " + t.portalId;
			} else {
				query = "SELECT zoneTo as zone FROM Portal WHERE id = " + t.portalId;
			}
			
			connection.query(query, function (err, portal) {

				if(err) {
					connection.release();
					return next(err);
				}
				if (lastTrans.length > 0) {
					if(lastTrans[0].zone != portal[0].zone) {

						connection.release();
						return next("Inconsistent data");
					}
				}
			 	query = "INSERT INTO Transaction(employeeId, portalId, timestamp, direction, alarm) "
					+ "VALUES (" + t.employeeId + ", " 
					+ t.portalId +", " 
					+ "FROM_UNIXTIME("+ t.timestamp +"), '" 
					+ t.direction + "', "
					+ t.alarm +")";

				connection.query(query, function(err, response) {
					if (err) {
						connection.release();
						return next(err);
					}
					if(lastTrans[0]) {
						query = "INSERT INTO TimeSpent"
	  					+ " (employeeId, zoneId, date, timeInside)"
						+ " VALUES (" + t.employeeId +  ", "
							+ portal[0].zone + 
							", CURDATE(), " 
							+ (t.timestamp / 1000 - lastTrans[0].timestamp) +")"
						+ " ON DUPLICATE KEY UPDATE"
						+ " timeInside = timeInside + VALUES(timeInside)";
						connection.query(query, function(err, response) {
							if(err) {
								connection.rollback();
								connection.release();
								return next(err);
							}
							connection.release();
							
						});
					} else {
						connection.release();
					}
				});
			});
		});
	});
});

module.exports = router;
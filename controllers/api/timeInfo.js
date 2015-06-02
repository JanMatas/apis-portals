var router = require('express').Router();
var db = require('../../db');
var config = require('../../config');
router.get('/',function(req, res, next){
	if(config.authenticate) {
		if (!req.auth) {
			return res.send(401);
		}
	}

	query = "SELECT z.id, z.name, SUM(ts.timeInside) as timeSum"
			+ " FROM TimeSpent ts RIGHT OUTER JOIN Zone z ON ts.zoneId=z.id" 
			+ " WHERE ts.employeeId =" + req.query.employeeId
			+ " AND ts.date<='" + req.query.endDate 
			+ "' AND ts.date>='" +req.query.startDate 
			+ "' GROUP BY z.id, z.name";
	db.fetchData(query, function(err, rows) {
		if(err) {
			return next(err);
		}
		
		res.json(rows);

	})

})

module.exports = router;

var router = require('express').Router();
var db = require('../../db');

router.get('/',function(req, res, next){


	query = "SELECT z.id, z.name, SUM(ts.timeInside) as timeSum"
			+ " FROM TimeSpent ts RIGHT OUTER JOIN Zone z ON ts.zoneId=z.id" 
			+ " WHERE ts.employeeId =" + req.query.employeeId
			+ " AND ts.date<='" + req.query.endDate 
			+ "' AND ts.date>='" +req.query.startDate 
			+ "' GROUP BY z.id, z.name";
	console.log(query)

	db.fetchData(query, function(err, rows) {
		if(err) {
			return next(err);
		}
		
		res.json(rows);

	})

})

module.exports = router;

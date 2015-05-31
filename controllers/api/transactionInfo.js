var router = require('express').Router();
var db = require('../../db');

router.get('/portal',function(req, res, next){

	
	query = "select e.firstname, e.lastname, UNIX_TIMESTAMP(t.timestamp) as timestamp, t.employeeId from Transaction t JOIN Employee e" +
			" ON e.id = t.employeeId" +
			" WHERE t.portalId = " + req.query.portalId +
			" ORDER BY timestamp DESC" +
			" LIMIT " + req.query.limit ;

	db.fetchData(query, function(err, rows) {
		if(err) {
			return next(err);
		}
		res.json(rows);

	})
})

module.exports = router;

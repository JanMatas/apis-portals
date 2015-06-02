var router = require('express').Router();
var db = require('../../db');
var config = require('../../config');
router.get('/',function(req, res, next){
	if(config.authenticate) {
		if (!req.auth) {
			return res.sendStatus(401);
		}
	}


	query = "select e.id as id, d.name as department, firstname,"
	      + "lastname, email, phone, validFrom "
	      + "from Employee e JOIN Department d ON e.departmentId = d.id";

	db.fetchData(query, function(err, rows) {
		if(err) {
			return next(err);
		}
		res.json(rows);

	})
})

module.exports = router;

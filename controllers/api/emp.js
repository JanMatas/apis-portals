var router = require('express').Router();
var db = require('../../db');

router.get('/',function(req, res, next){

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

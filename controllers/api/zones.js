var router = require('express').Router();
var db = require('../../db');

router.get('/',function(req, res, next){

	query = "SELECT * FROM Zone"
	db.fetchData(query, function(err, zones) {

			if(err) {
				return res.send(500, err);
			}
			return res.json(zones);
		})
			
})

module.exports = router;
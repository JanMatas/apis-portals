var router = require('express').Router();
var db = require('../../db');

router.get('/',function(req, res, next){

	
	res.send(200)
})
router.post('/', function(req, res, next) {

	var t = req.body.transaction
 	console.log(t)
    
	query = "INSERT INTO Transaction(employeeId, portalId, timestamp, direction, alarm) "
	+ "VALUES (" + t.employeeId + ", " + t.portalId +", FROM_UNIXTIME("+ t.timestamp +"), '" + t.direction + "', "+ t.alarm +")";
	console.log(query);
	db.executeQuery(query, function (err) {
		if (err) {
			console.log(err)
			return res.send(500, err);
			} 
		res.send(201)	
	})
		
	

	

});

module.exports = router;
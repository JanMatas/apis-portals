var router = require('express').Router();
var connection = require('../../db');

router.get('/',function(req, res, next){

	connection( function (err, connection) {
		// handle errors
		if (err) {
			connection.release();
			return res.send(100, "Error in connection database");
		}
		connection.on('error', function(err) {      
              res.send(100, "Error in connection database");
              return;     
        });

		query = "select * from Zone";
		connection.query(query,function(err,rows){
            connection.release();
            if(!err) {
                res.json(rows);
            }           
        });

	})
})

module.exports = router;
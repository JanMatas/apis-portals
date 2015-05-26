
var router = require('express').Router();
var jwt = require('jwt-simple');
var config = require('../../config');
var bcrypt = require('bcrypt');
var db = require('../../db');


router.post('/', function (req, res, next) {
	query = "SELECT username, password FROM User WHERE username = '" + req.body.username + "'";
	db.fetchData(query, function(err, rows) {
		
		if (err) {
			return next(err);
		}
		if (rows.length == 0) {
			return res.send(401);
		}


		bcrypt.compare(req.body.password, rows[0].password, function (err, valid) {
			if (err) {
				return next(err);
			}
			if (err || !valid) {

				return res.send(401);
			}
			var token = jwt.encode({username: rows[0].username}, config.secret);
			res.send(token);		
		});

	});
});

module.exports = router
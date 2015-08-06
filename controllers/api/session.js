
var router = require('express').Router();
var jwt = require('jwt-simple');
var config = require('../../config');
var bcrypt = require('bcrypt');
var db = require('../../db');
var squel = require('squel');

router.post('/', function (req, res, next) {
	var s = squel.select()
		.fields(["username", "password"])
		.from("por_admin")
		.where("username = '" + req.body.username + "'");


	db.fetchData(s.toString(), function(err, rows) {
		
		if (err) {
			return next(err);
		}
		if (rows.length === 0) {
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

module.exports = router;
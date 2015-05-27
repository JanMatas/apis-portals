var User = require('../../models/user');
var router = require('express').Router();

var jwt = require('jwt-simple');
var bcrypt = require('bcrypt');
var config = require('../../config');

router.get('/', function(req, res, next) {
	if (!req.headers['x-auth']) {
		return res.send(401);
	}
	var token = req.headers['x-auth'];

	var auth = jwt.decode(token, config.secret);
	User.findOne({username: auth.username}, function (err, user) {
		if (err) {
			return next(err);
		}
		
		res.json(user);
	});

});

router.post('/', function(req, res, next) {
	var user = new User({username: req.body.username});
	bcrypt.hash(req.body.password, 10, function (err, hash) {
		user.password = hash;
		user.save (function (err) {
			if (err) {
				throw next(err);
			}
			res.send(201);
		});
	});
});

module.exports = router;

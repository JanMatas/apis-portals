var router = require('express').Router();
var db = require('../../db');
var config = require('../../config');
var _ = require('lodash');
var ws = require('../../websockets.js');
var authUtils = require('../../authUtils.js');

router.get('/:id', function(req, res, next) {
	var username = authUtils.authReq(req);
	if (username === undefined) {
		return res.sendStatus(401);
	}

    query = "select * from building b JOIN user_building ub ON b.id = ub.buildingId and b.id=" + req.params.id + " where ub.username='" + username+"'";

    db.fetchData(query, function(err, buidling) {
        if (err) {
            return next(err);
        }
        res.json(building);

    });
});


router.get('/', function(req, res, next) {
	var username = authUtils.authReq(req);
	if (username === undefined) {
		return res.sendStatus(401);
	}

    query = "select * from building b JOIN user_building ub ON b.id = ub.buildingId where ub.username='" + username+"'";
    db.fetchData(query, function(err, rows) {
        if (err) {
            return next(err);
        }
        res.json(rows);

    });
});

router.get('/');

module.exports = router;
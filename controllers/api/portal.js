var router = require('express').Router();
var db = require('../../db');
var config = require('../../config');
var _ = require('lodash');
var ws = require('../../websockets.js');
var squel = require('squel');
var authUtils = require('../../authUtils');
var apiUtils = require('./apiUtils');

router.get('/:id', function(req, res, next) {

	// Auth user
    var username = authUtils.authReq(req);
	if (username === undefined) {
		return res.sendStatus(401);
	}

	// Get query and add ID check
    var fields = apiUtils.getFields(req, "portal");
	var query = getQuery(fields);
	query.where("sys_reader.pk_ = " + req.query.id);


	// Get data from DB
    db.fetchData(query.toString, function(err, portals) {
        if (err) {
            return next(err);
        }
        // Add information about portal status
        portals[0].status = getPortalStatus(portals[0].raspiId);

        //send data back
        res.json(portals);
    });
});


router.get('/', function(req, res, next) {
    
    // Auth user
    var username = authUtils.authReq(req);
	if (username === undefined) {
		return res.sendStatus(401);
	}

	// Get query
    var fields = apiUtils.getFields(req, "portal");
    var query = getQuery(fields);

    // Fetch data from DB
    db.fetchData(query.toString(), function(err, portals) {
        if (err) {
            return next(err);
        }

        // Add status information
        for (var p in portals) {

        	portals[p].status = getPortalStatus(portals[p].raspiId);
        }

        // Return data
        res.json(portals);

    });
});

router.get('/');

module.exports = router;


// Get status of the portal from websocket server
function getPortalStatus(raspiId) {
    var connectedPortal = _.find(ws.portals, {
        uuid: raspiId

    });
    if (connectedPortal === undefined) {
        return "disconnected";
    } else {
        return connectedPortal.status;
    }
}

// Construct DB query
function getQuery(fields) {
	var s = squel.select()
		.fields(fields)
		.from('sys_reader');
	return s;
}
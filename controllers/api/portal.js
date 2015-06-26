var router = require('express').Router();
var db = require('../../db');
var config = require('../../config');
var _ = require('lodash');
var ws = require('../../websockets.js');
router.get('/:id', function(req, res, next) {
    if (config.authenticate) {
        if (!req.auth) {
            return res.sendStatus(401);
        }
    }


    query = "select * from Portal WHERE id =" + req.params.id;

    db.fetchData(query, function(err, portals) {
        if (err) {
            return next(err);
        }

        var connectedPortal = _.find(ws.portals, {
            uuid: portals[0].raspiId

        });
        console.log(ws.portals);
        if (connectedPortal === undefined) {
            portals[0].status = "disconnected";
        } else {
            portals[0].status = connectedPortal.status;
        }


        res.json(portals);

    });
});


router.get('/', function(req, res, next) {
    if (config.authenticate) {
        if (!req.auth) {
            //return res.sendStatus(401);
        }
    }


    query = "select * from Portal";

    db.fetchData(query, function(err, rows) {
        if (err) {
            return next(err);
        }
        res.json(rows);

    });
});

router.get('/');

module.exports = router;
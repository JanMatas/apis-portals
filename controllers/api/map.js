var connection = require('../../db');
var router = require('express').Router();
var jwt = require('jwt-simple')
var db = require('../../db')
var config = require('../../config')
var ws = require('../../websockets.js');
var _ = require('lodash')
router.get('/', function(req, res, next) {
    if (config.authenticate) {
        if (!req.auth) {
            //return res.send(401);
        }
    }

    var query = "SELECT * FROM Zone z where buildingId = " + req.query.buildingID;


    db.fetchData(query, function(err, zones) {
        query = "SELECT * FROM Portal where buildingId = " + req.query.buildingID;

        db.fetchData(query, function(err, portals) {
            if (err) {

                return next(err);
            }
            if (zones == []) {
                return next("not found");
            }
            var portalObjects = ws.portals; 
            console.log(portalObjects)
            for (p in portals) {

                var connectedPortal = _.find(portalObjects, {
                    uuid: portals[p].raspiId
                })
                
                if (connectedPortal == undefined) {
                    portals[p].status = "disconnected";
                } else {
                    portals[p].status = connectedPortal.status;
                }

            }

            res.json({
                zones: zones,
                portals: portals
            });
        });
    });
});

router.post('/', function(req, res, next) {
    if (config.auth) {
        if (!req.headers['x-auth']) {
            return res.send(401);
        }
        var token = req.headers['x-auth'];
        var auth = jwt.decode(token, config.secret);
    }
    var nodePositions = req.body.nodePositions

    for (n in nodePositions) {
        // make sure its a node, not an edge
        if (n < 100000) {

            var query = "";
            if (n < 10000) {
                //its a zone
                query = "UPDATE Zone SET " +
                    "map_x=(" + nodePositions[n].x +
                    "), map_y=(" + nodePositions[n].y +
                    ") WHERE id=" + n;
            } else {
                query = "UPDATE Portal SET " +
                    "map_x=(" + nodePositions[n].x +
                    "), map_y=(" + nodePositions[n].y +
                    ") WHERE id=" + (n - 10000);

            }

            db.executeQuery(query, function(err) {
                if (err) {
                    console.log(err)
                    return res.send(500, err);
                }

            })
        }
    }
    res.send(201)

});




module.exports = router
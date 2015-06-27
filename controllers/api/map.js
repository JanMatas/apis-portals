var connection = require('../../db');
var router = require('express').Router();
var jwt = require('jwt-simple')
var db = require('../../db')
var config = require('../../config')
var ws = require('../../websockets.js');
var squel = require('squel')
var _ = require('lodash')
var apiUtils = require('./apiUtils');
router.get('/', function(req, res, next) {

    if (config.authenticate) {
        if (!req.auth) {
            //return res.send(401);
        }
    }

    var fields = apiUtils.getFields(req, "map_zones");

    var s = squel.select()
        .from('sys_area')
        .fields(fields)
        .left_join('por_zone', null, 'por_zone.sys_area_pk_ = sys_area.pk_')
        .where('sys_area.lft = sys_area.rgt - 1')
            .where('sys_area.lft BETWEEN ? AND ?',
                squel.select()
                .field("lft")
                .from("sys_area")
                .where("pk_ = ?", req.query.buildingID),
                squel.select()
                .field("rgt")
                .from("sys_area")
                .where("pk_ = ?", req.query.buildingID)
        );
    console.log(fields);




    db.fetchData(s.toString(), function(err, zones) {
        var zoneIds = []
        _.forEach(zones, function(zone) {
            zoneIds.push(zone.id)
        });

        console.log(zoneIds)
        
        fields = apiUtils.getFields(req, "map_portals");


        query = squel.select()
            .fields(fields)
            .from("sys_reader")
            .left_join("por_portal", null, "por_portal.sys_reader_pk_ = sys_reader.pk_")
            .where(squel.expr()
                .or("area_inp_pk_ in (" + zoneIds.join() + ")")
                .or("area_out_pk_ in (" + zoneIds.join() + ")"))
            .toString();
        console.log(query)

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
    console.log(nodePositions[8])
    for (n in nodePositions) {
        // make sure its a node, not an edge
        if (n < 100000) {
            squelMysql = squel.useFlavour('mysql');
            var query = "";
            if (n < 10000) {
                //its a zone
                query = squelMysql.insert()
                    .into("por_zone")
                    .set("sys_area_pk_", n)
                    .set("map_x", nodePositions[n].x)
                    .set("map_y", nodePositions[n].y)
                    .onDupUpdate("map_x", nodePositions[n].x)
                    .onDupUpdate("map_y", nodePositions[n].y)
                    .toString()

            } else {
                query = squelMysql.insert()
                    .into("por_portal")
                    .set("sys_reader_pk_", n - 10000)
                    .set("map_x", nodePositions[n].x)
                    .set("map_y", nodePositions[n].y)
                    .onDupUpdate("map_x", nodePositions[n].x)
                    .onDupUpdate("map_y", nodePositions[n].y)
                    .toString()

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
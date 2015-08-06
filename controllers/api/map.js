var connection = require('../../db');
var router = require('express').Router();
var jwt = require('jwt-simple');
var db = require('../../db');
var config = require('../../config');
var ws = require('../../websockets.js');
var squel = require('squel');
var _ = require('lodash');
var apiUtils = require('./apiUtils');
var authUtils = require("../../authUtils");

router.get('/', function(req, res, next) {

    var username = authUtils.authReq(req);
    if (username === undefined) {
        return res.sendStatus(401);
    }

    var fields = apiUtils.getFields(req, "map_zones");

    var s = squel.select()
        .from('sys_area')
        .fields(fields)
       
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




    db.fetchData(s.toString(), function(err, zones) {
        var zoneIds = [];
        _.forEach(zones, function(zone) {
            zoneIds.push(zone.id);
        });


        fields = apiUtils.getFields(req, "map_portals");


        query = squel.select()
            .fields(fields)
            .from("sys_reader")
            
            .where(squel.expr()
                .or("area_inp_pk_ in (" + zoneIds.join() + ")")
                .or("area_out_pk_ in (" + zoneIds.join() + ")"))
            .toString();

        db.fetchData(query, function(err, portals) {
            if (err) {

                return next(err);
            }
            if (zones == []) {
                return next("not found");
            }
            var portalObjects = ws.portals;
            for (var p in portals) {

                var connectedPortal = _.find(portalObjects, {
                    uuid: portals[p].raspiId
                });

                if (connectedPortal === undefined) {
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
    // Callback for databse insert
    var saveCallback = function(err) {
        if (err) {
            console.log(err);
            return res.send(500, err);
        }

    };

    
    var username = authUtils.authReq(req);
    if (username === undefined) {
        return res.sendStatus(401);
    }

    var nodePositions = req.body.nodePositions;

    for (var n in nodePositions) {
        type = nodePositions[n].id.charAt(0); 
        id = nodePositions[n].id.slice(1);
        squelMysql = squel.useFlavour('mysql');
        var query = squelMysql.update();
        if (type === 'n') {
            query.table("sys_area")
                .where("pk_ = " + id);
        } else {
            query.table("sys_reader")
                .where("pk_ = " + id);
        }

        query = query.set("map_x", nodePositions[n].x)
            .set("map_y", nodePositions[n].y)

            .toString();



        db.executeQuery(query, saveCallback);
        
    }
    res.sendStatus(201);

});




module.exports = router;
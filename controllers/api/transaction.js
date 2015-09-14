var router = require('express').Router();
var db = require('../../db');
var config = require('../../db');
var authUtils = require('../../authUtils');
var apiUtils = require('./apiUtils');
var squel = require('squel');

router.get('/portal/:portalId', function(req, res, next) {

    
    var username = authUtils.authReq(req);

    if (username === undefined) {
        // Not authenticated, return unauthorized
        return res.sendStatus(401);
    }


    var fields = apiUtils.getFields(req, "transaction");
    if (fields === undefined) {
        return res.sendStatus(400);
    }

    var s = squel.select()
        .fields(fields)
        .from("sys_elog")
        .left_join("sys_user", null, "sys_elog.sys_user_pk_ = sys_user.pk_")
        .where("sys_elog.t_reader = " + req.params.portalId)
        .order("t_date", false);

    if (req.query.limit !== undefined) {
        s.limit(req.query.limit);
    }


    db.fetchData(s.toString(), function(err, rows) {
        if (err) {
            return next(err);
        }
        res.json(rows);
    });
});


router.get('/zone/:zoneId', function(req, res, next) {

    var username = authUtils.authReq(req);

    if (username === undefined) {
        // Not authenticated, return unauthorized
        return res.sendStatus(401);
    }

    var fields = apiUtils.getFields(req, "transaction");
    if (fields === undefined) {
        return res.sendStatus(400);
    }

    var subZones = squel.select()
        .field("child_pk_")
        .from("por_subarea")
        .where("parent_pk_ =" + req.params.zoneId);

    var s = squel.select()
        .fields(fields)
        .from("sys_elog")
        .join("sys_user", null, "sys_elog.sys_user_pk_ = sys_user.pk_")
        .join("sys_reader", null, "sys_elog.t_reader = sys_reader.pk_")
        .join("sys_area", "in", "sys_reader.area_inp_pk_ = in.pk_")
        .join("sys_area", "out", "sys_reader.area_out_pk_ = out.pk_")

        .where("sys_reader.area_inp_pk_ in (" + subZones.toString() + ") OR sys_reader.area_out_pk_ in (" + subZones.toString() + ")");
    
    if (req.query.from !== undefined) {
        s.where("t_date > FROM_UNIXTIME(" + req.query.from + ")");
    }
    if (req.query.to !== undefined) {
        console.log("TO : " + req.query.to)
        s.where("t_date < FROM_UNIXTIME(" + req.query.to + ")");
    }
    if (req.query.limit !== undefined) {
        s.limit(req.query.limit);
    }

    db.fetchData(s.toString(), function(err, rows) {
        if (err) {
            return next(err);
        }

        res.json(rows);

    });


});

module.exports = router;
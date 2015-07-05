var router = require('express').Router();
var db = require('../../db');
var authUtils = require('../../authUtils');
var apiUtils = require('./apiUtils');
var squel = require('squel');

var processGetRequest = function(req, res, next) {

    var id = req.params.departmentId; 
    // Get username from auth headers
    var username = authUtils.authReq(req);

    if (username === undefined) {
        // Not authenticated, return unauthorized
        return res.sendStatus(401);
    }


    var fields = apiUtils.getFields(req, "department");
    if (fields === undefined) {
        return res.sendStatus(400);
    }


    
    var s = squel.select()
        .fields(fields)
        .from("sys_ostr");

    if (id) {
       s.where("sys_ostr.pk_ = " + id);
    }

    db.fetchData(s.toString(), function(err, zones) {

        if (err) {
            return next(err);
        }
        return res.json(zones);
    });

};




router.get('/:departmentId', processGetRequest);
router.get('/', processGetRequest);




module.exports = router;
var router = require('express').Router();
var db = require('../../db');
var config = require('../../config');
var _ = require('lodash');
var ws = require('../../websockets.js');
var authUtils = require('../../authUtils.js');
var apiUtils  = require('./apiUtils');
var squel = require("squel");



function processGetRequest(req, res, next) {

    // Try to get ID, if undefined, it returns all visible employees
    id = req.params.buildingId;
	
    var username = authUtils.authReq(req);
	if (username === undefined) {
		return res.sendStatus(401);
	}

    var fields = apiUtils.getFields(req, "building");


    // Get all non leaf nodes
    var s = squel.select()
        .fields(fields)
        .from("sys_area")
        .where("sys_area.lft != sys_area.rgt - 1");
    if (id) {
        s.where("sys_area.pk_ = " + id);
    }

    
    db.fetchData(s.toString(), function(err, data) {
        if (err) {
            return next(err);
        }
        res.json(data);

    });
}

router.get('/:buildingId', processGetRequest);
router.get('/', processGetRequest);


module.exports = router;
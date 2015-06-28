var router = require('express').Router();
var db = require('../../db');
var config = require('../../db');
var authUtils = require('../../authUtils');
var apiUtils = require('./apiUtils');
var squel = require('squel');

router.get('/',function(req, res, next){
    

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
    	.join("sys_user", null, "sys_elog.sys_user_pk_ = sys_user.pk_")
    	.where("sys_elog.t_reader = " + req.query.portalId)
    	.order("t_date", false)
    	.limit(req.query.limit);


	db.fetchData(s.toString(), function(err, rows) {
		if(err) {
			return next(err);
		}
		res.json(rows);

	});
});

module.exports = router;

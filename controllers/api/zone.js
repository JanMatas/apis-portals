var router = require('express').Router();
var db = require('../../db');
var config = require('../../config');
var squel = require('squel');
var authUtils = require('../../authUtils');


router.get('/', function(req, res, next) {
    if (config.authenticate) {
        if (!req.auth) {
            return res.send(401);
        }
    }
    var username = authUtils.authReq(req);
    if (username === undefined) {
        // Not authenticated, return unauthorized
        return res.sendStatus(401);
    }

    var s = squel.select()
        .field("child.pk_", "id")
        .field("child.cname", "label")
        .field("COUNT(parent.pk_) - 1", "depth")
        .from("sys_area", "child")
        .cross_join("sys_area", "parent")
        .where("child.lft between parent.lft and parent.rgt")
        .group("child.pk_, child.cname")
        .order("child.lft");

    var query = squel.select()
        .from("por_user_permission")
        .join(s, "areas", "areas.id = por_user_permission.sys_area_pk_")
        .where("por_user_permission.username = '" + username +"'");

    db.fetchData(query.toString(), function(err, rows) {

        if (err) {
            return next(err);
        }
        var trees = {};
        var currentDepth = 0;


        return res.json(getChildren(rows, 0, 0));
    });

});

function getChildren(rows, index, currentDepth) {
    var children = [];
    var i = index;
    while (i < rows.length) {
        if (rows[i].id === 2) {

        }
        if (rows[i].depth === currentDepth) {

            rows[i].children = getChildren(rows, i + 1, currentDepth + 1);
            children.push(rows[i]);
           
            
        } else if (rows[i].depth < currentDepth) {
            return children;
        }
        i++;
    }
    return children;
}

module.exports = router;
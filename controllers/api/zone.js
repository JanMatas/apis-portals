var router = require('express').Router();
var db = require('../../db');
var config = require('../../config');
var squel = require('squel');
router.get('/', function(req, res, next) {
    if (config.authenticate) {
        if (!req.auth) {
            return res.send(401);
        }
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

    db.fetchData(s.toString(), function(err, rows) {

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
            console.log(currentDepth);
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
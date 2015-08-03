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


    function getChildren(rows, index, currentDepth) {
        var children = [];
        var i = index;
        while (i < rows.length) {


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

    db.fetchData(query.toString(), function(err, rows) {

        if (err) {
            return next(err);
        }
        var trees = {};
        var currentDepth = 0;



        return res.json(getChildren(rows, 0, 0));
    });

});


router.get('/:zoneId', function(req, res, next) {
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
        .field("sys_area.pk_", "id")
        .field("sys_area.cname", "label")
        .from("sys_area");

    var empLastTransId = squel.select()
        .field("sys_elog.sys_user_pk_")
        .field("MAX(sys_elog.t_date)")
        .from("sys_elog")
        .group("sys_elog.sys_user_pk_")

    var empLastTransaction  = squel.select()

        .field("sys_elog.sys_user_pk_", "employeeId")
        .field("sys_elog.pk_")
        .field("sys_elog.ss6", "direction")
        .field("sys_elog.t_reader", "t_reader")
        
        
        .from("sys_elog")
        .where("(sys_elog.sys_user_pk_, sys_elog.t_date) IN ? ", empLastTransId)
        

    var employeeCurrentZone  = squel.select()
        .field("IF(STRCMP(employee_last_transaction.direction, 'In'), in.pk_, out.pk_)", "current_zone")
        .field("employee_last_transaction.direction","direction" )
        .field("sys_user.pk_", "employeeId")
        .field("sys_user.firstname", "firstname")
        .field("sys_user.lastname", "lastname")
        .from(empLastTransaction, "employee_last_transaction")
        .join("sys_user", null, "employee_last_transaction.employeeId = sys_user.pk_")
        .join("sys_reader", null, "employee_last_transaction.t_reader = sys_reader.code")
        .join("sys_area", "in", "sys_reader.area_inp_pk_ = in.pk_")
        .join("sys_area", "out", "sys_reader.area_out_pk_ = out.pk_");
   


    var query = squel.select()
        .field("employeeId")
        .field("firstname")
        .field("lastname")
        .field("direction")
        .from("por_user_permission")
        .join(s, "areas", "areas.id = por_user_permission.sys_area_pk_")
        .join(employeeCurrentZone, "current_zone", "areas.id = current_zone")
        .where("por_user_permission.username = '" + username +"'")
        .where("areas.id ='" + req.params.zoneId +"'" );

   
    console.log(query.toString())
    db.fetchData(query.toString(), function(err, rows) {

        if (err) {
            return next(err);
        }

        return res.json(rows);
    });

});



module.exports = router;


var router = require('express').Router();
var db = require('../../db');
var config = require('../../config');
var authUtils = require('../../authUtils');
var apiConfig = require('./config');
var mysql = require('mysql');
var apiUtils = require('./apiUtils');
var _ = require('lodash');

var squel = require('squel');

router.get('/:empId', processGetRequest);
router.get('/', processGetRequest);

router.put('/:empId', processPutRequest);
router.post('/', processPostRequest);





module.exports = router;


function processGetRequest(req, res, next) {
    // Get all available field names from config file
    availableFields = Object.keys(apiConfig.availableFields.emp);

    var requestedFields;

    // Try to get ID, if undefined, it returns all visible employees
    id = req.params.empId;

    // Get username from auth headers
    var username = authUtils.authReq(req);
    var fields = apiUtils.getFields(req, "emp");

    if (username === undefined) {
        // Not authenticated, return unauthorized
        return res.sendStatus(401);
    }

    if (fields === undefined) {
        return res.sendStatus(400);
    }


    var s = squel.select()
        .distinct()
        .fields(fields)
        // Get all the data about user
        .from("sys_user")
        
   
        // Employment type
        .join("sys_employmenttype", null, "sys_employmenttype.pk_ = sys_user.sys_employmenttype_pk_")
       
        // Department
        .join("sys_ostr", null, "sys_user.sys_ostr_pk_ = sys_ostr.pk_")
        // Find employee permissions
        .left_join("por_user_permission", "emp_permission", "sys_user.pk_ = emp_permission.sys_user_pk_")

        .order("sys_user.pk_");
        //.where("user_permission.sys_area_pk_ = emp_permission.sys_area_pk_");


        console.log(s.toString());


    if (id) {
        console.log("id : " + id);
        s.where("sys_user.pk_ = " + id);
    }





    // Fetch data from DB
    db.fetchData(s.toString(), function(err, rows) {

        if (err) {
            return next(err);
        }

        // group allowed zones into an array
        if (apiUtils.hasField("allowedZones", req)) {
            var lastID = rows;


            var result = [];
            for (var i in rows) {
                if (lastID === undefined || rows[i].id != lastID) {
                    newRow = rows[i];
                    newRow.allowedZones = [newRow.allowedZones];
                    result.push(newRow);
                    lastID = rows[i].id;
                } else {
                    result[result.length - 1].allowedZones.push(rows[i].allowedZones);
                }

            }
            return res.json(result);
        } else {
            return res.json(rows);
        }



    });

}


function processPutRequest(req, resp, next) {
    var zoneRows = [];
    for (var z in req.body.allowedZones) {
        zoneRows.push({
            sys_user_pk_: req.body.id,
            sys_area_pk_: req.body.allowedZones[z]

        });
    }

    squelMysql = squel.useFlavour('mysql');

    var zoneQuery1 = squel.delete()
        .from("por_permission")
        .where("sys_area_pk_ NOT IN (" + req.body.allowedZones.toString() + ")")
        .where("sys_user_pk_ = " + req.body.id);


    var zoneQuery2 = squelMysql.insert()
        .into("por_permission")
        .setFieldsRows(zoneRows)
        .onDupUpdate("sys_user_pk_", req.body.id); // hack to ignore duplicate inserts
    console.log("Query 2 : " + zoneQuery2.toString());

    var userQuery = squel.update()
        .table("sys_user")

        .set("email", req.body.email)
        .set("phone", req.body.phone)
        .set("sex", req.body.gender === "Male" ? "M" : "F")
        .set("firstname", req.body.firstname)
        .set("lastname", req.body.lastname)
        
        .where("pk_ = " + req.body.id);

 



    db.getConnection(function(err, connection) {
        connection.beginTransaction(function(err) {
            if (err) {
                next(err);
            }
            connection.query(userQuery.toString(), function(err, result) {
                if (err) {
                    connection.rollback(function() {
                        next(err);
                    });

                }
                connection.query(zoneQuery1.toString(), function(err, result) {
                    if (err) {
                        connection.rollback(function() {
                            next(err);
                        });
                    }
                    connection.query(zoneQuery2.toString(), function(err, result) {
                        if (err) {
                            connection.rollback(function() {
                                next(err);
                            });
                        }

 
                            connection.commit(function(err) {
                                if (err) {
                                    connection.rollback(function() {
                                        next(err);
                                    });
                                }
                                console.log('success!');
                           
                        });
                    });
                });
            });
        });
    });



}

function processPostRequest(req, resp, next) {


}
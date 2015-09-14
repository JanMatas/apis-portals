var router = require('express').Router();
var db = require('../../db');
var config = require('../../config');
var authUtils = require('../../authUtils');
var apiConfig = require('./config');
var mysql = require('mysql');
var apiUtils = require('./apiUtils');
var _ = require('lodash');
var mv = require('mv')

var squel = require('squel');
var multiparty = require('connect-multiparty')
multipartyMiddleware = multiparty()


router.get('/:empId', processGetRequest);
router.get('/', processGetRequest);

router.put('/:empId',multipartyMiddleware, processPutRequest);
router.post('/', multipartyMiddleware, processPostRequest);




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





    if (id) {
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

    var file = req.files.file;
    var data =  JSON.parse(req.body.data);


    var zoneRows = [];
    for (var z in data.allowedZones) {
        zoneRows.push({
            sys_user_pk_: data.id,
            sys_area_pk_: data.allowedZones[z]

        });
    }

    squelMysql = squel.useFlavour('mysql');

    var zoneQuery1 = squel.delete()
        .from("por_permission")
        .where("sys_area_pk_ NOT IN (" + data.allowedZones.toString() + ")")
        .where("sys_user_pk_ = " + data.id);



    var zoneQuery2 = squelMysql.insert()
        .into("por_permission")
        .setFieldsRows(zoneRows)
        .onDupUpdate("sys_user_pk_", data.id); // hack to ignore duplicate inserts


    var userQuery = squelMysql.update()
        .table("sys_user")

        .set("email", data.email)
        .set("phone", data.phone)
        .set("sex", data.gender === "Male" ? "M" : "F")
        .set("firstname", data.firstname)
        .set("lastname", data.lastname)
        .set("tag", data.tagNumber)
        .where("pk_ = " + data.id);




  

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
                    if (err.code === 'ER_DUP_ENTRY') {
                        resp.send(500, "ER_DUP_ENTRY")
                    } else {
                        next(err)
                    }


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
                                if (file) {
                                    mv(file.path, 'data/images/emps/' +data.id + '.jpg', function(err) {
                                        resp.sendStatus(200)
                           
                            });
                                } else {
                                    resp.sendStatus(200)
                                }

                        });
                    });
                });
            });
        });
    });



}

function processPostRequest(req, resp, next) {
    var data =  JSON.parse(req.body.data);


    var file = req.files.file;


 // hack to ignore duplicate inserts

    squelMysql = squel.useFlavour('mysql');
    var userQuery = squelMysql.insert()
        .into("sys_user")
        .set("sys_ostr_pk_", data.department)
        .set("email", data.email)
        .set("phone", data.phone)
        .set("sex", data.gender === "Male" ? "M" : "F")
        .set("firstname", data.firstname)
        .set("lastname", data.lastname)
        .set("tag", data.tagNumber)


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
                    next(err)
                }


                console.log(err)
                id = result.insertId;
                var zoneRows = [];
                for (var z in data.allowedZones) {
                    zoneRows.push({
                        sys_user_pk_: id,
                        sys_area_pk_: data.allowedZones[z]

                    });
                }
                var zoneQuery = squelMysql.insert()
                    .into("por_permission")
                    .setFieldsRows(zoneRows)
                    .onDupUpdate("sys_user_pk_", id);
                connection.query(zoneQuery.toString(), function(err, result) {
                    if (err) {
                        connection.rollback(function() {
                            next(err);
                        });
                        next(err)
                    }



                        connection.commit(function(err) {
                            if (err) {
                                connection.rollback(function() {
                                    next(err);
                                });
                            }
                            if (file) {
                                mv(file.path, 'data/images/emps/' +id + '.jpg', function(err) {
                                next(err)
                        });
                            }
                            resp.sendStatus(200)
                    });
                });

            });
        });
    });

}

var router = require('express').Router();
var db = require('../../db');
var config = require('../../config');
var authUtils = require('../../authUtils');
var apiConfig = require('./config');
var mysql = require('mysql');
var _ = require('lodash');


var processGetRequest = function(req, res, next, id) {
    availableFields = Object.keys(apiConfig.availableFields.emp);



    var username = authUtils.authReq(req);
    if (username === undefined) {
        return res.sendStatus(401);
    } else {
	    if (req.query.fields) {
	    	requestedFields = req.query.fields.split(",");
		    if ((_.intersection(requestedFields, availableFields)).length != requestedFields.length) {
		        return res.sendStatus(400);
		    }

	    } else {
	    	requestedFields = [];
	    }
	}
    
    requestedFields = _.union(requestedFields,apiConfig.defaultFields.emp);
    colNames = [];
    requestedFields.forEach(function (element) {
        colNames.push(apiConfig.availableFields.emp[element] + " AS " + element);

    });
    console.log(colNames);

    db.getConnection(function(err, connection) {
        // handle errors
        if (err) {
            connection.destroy();
            next(error);
            return;
        }

        connection.on('error', function(err) {
            connection.destroy();
            next(error);
            return;
        });

        if (id) {
        	sql = "SELECT " + requestedFields.join() + " FROM Employee e JOIN Department d ON e.departmentId = d.id JOIN user_building ub using (buildingId) WHERE ub.username ='" + username + "' and e.id = " + id;
        } else {
            sql = "SELECT " + colNames.join() + " FROM Employee e JOIN Department d ON e.departmentId = d.id JOIN user_building ub using (buildingId) WHERE ub.username ='" + username + "'"
        }
        

        console.log(sql)


        connection.query(sql, function(err, results) {

            connection.destroy();
            if (err) {
                next(err);
            }

            return res.json(results);
        });
    });
};


router.get('/:empId', function(req, res, next) {
	processGetRequest(req, res, next, req.params.empId);

});

router.get('/', function(req, res, next) {
	processGetRequest(req, res, next, undefined);

});



module.exports = router;
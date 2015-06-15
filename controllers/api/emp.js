var router = require('express').Router();
var db = require('../../db');
var config = require('../../config');
var authUtils = require('../../authUtils')
var apiConfig = require('./config')
var mysql = require('mysql')
var _ = require('lodash')


var processGetRequest = function(req, res, next, id) {
    
    var username = authUtils.authReq(req);
    if (username == undefined) {
        return res.sendStatus(401);
    } else {
	    if (req.query.fields) {
	    	requestedFields = req.query.fields.split(",")
		    if ((_.intersection(requestedFields, apiConfig.availableFields.emp)).length != requestedFields.length) {
		        return res.sendStatus(400);
		    }

	    } else {
	    	requestedFields = []
	    }
	}
    
    requestedFields = _.union(requestedFields,apiConfig.defaultFields.emp)

    db.getConnection(function(err, connection) {
        // handle errors
        if (err) {
            connection.destroy()
            next(error)
            return;
        }

        connection.on('error', function(err) {
            connection.destroy()
            next(error)
            return;
        });

        if (id) {
        	sql = "SELECT ?? FROM Employee e JOIN Department d ON e.departmentId = d.id JOIN user_building ub using (buildingId) WHERE ub.username = ? and e.id = ?"
        } else {
        	sql = "SELECT ?? FROM Employee e JOIN Department d ON e.departmentId = d.id JOIN user_building ub using (buildingId) WHERE ub.username = ?"
        }
        
        connection.query(sql, [requestedFields, username, id], function(err, results) {

            connection.destroy();
            if (err) {
                next(err)
            }

            return res.json(results)
        });
    })
}



router.get('/:empId', function(req, res, next) {
	processGetRequest(req, res, next, req.params.empId);

})

router.get('/', function(req, res, next) {
	processGetRequest(req, res, next, undefined);

})

router.post('/', function(req, res, next) {
	db.getConnection(function(err, connection) {
        // handle errors
        if (err) {
            connection.destroy()
            next(error)
            return;
        }

        connection.on('error', function(err) {
            connection.destroy()
            next(error)
            return;
        });

        connection.query('INSERT INTO posts SET ?', {title: 'test'}, function(err, result) {
		  if (err) throw err;

		  console.log(result.insertId);
		});

        if (id) {
        	sql = "SELECT ?? FROM Employee e JOIN Department d ON e.departmentId = d.id JOIN user_building ub using (buildingId) WHERE ub.username = ? and e.id = ?"
        } else {
        	sql = "SELECT ?? FROM Employee e JOIN Department d ON e.departmentId = d.id JOIN user_building ub using (buildingId) WHERE ub.username = ?"
        }
        
        connection.query(sql, [requestedFields, username, id], function(err, results) {

            connection.destroy();
            if (err) {
                next(err)
            }

            return res.json(results)
        });
    })
})



module.exports = router;
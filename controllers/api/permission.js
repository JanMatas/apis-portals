var router = require('express').Router();
var db = require('../../db');
var authUtils = require('../../authUtils');
var apiUtils = require('./apiUtils');

var processGetRequest = function(req, res, next) {

    var id = req.params.departmentId; 
    // Get username from auth headers
    var username = authUtils.authReq(req);

    if (username === undefined) {
        // Not authenticated, return unauthorized
        return res.sendStatus(401);
    }

    var resource = req.params.resource;

    if (!(resource === undefined || resource == "zone" || resource == "employee")) {
        res.sendStatus(404);
    }

    var endpoint = "permission";
    colNames = apiUtils.getColumnNames(req, endpoint);
    if (colNames === undefined) {
        return res.sendStatus(400);
    }

    if (resource == "zone") {
        if (id) {

        }
        query = "SELECT "+ colNames.join()+ " FROM Permission p JOIN Employee e ON e.id = p.employeeId JOIN Zone z ON p.zoneId = z.id JOIN user_building ub ON USING (buildingID) WHERE ub.username ='" + username+ "' AND e.id =" + id;

    } else {
        query = "SELECT "+ colNames.join()+ " FROM Permission p JOIN Employee e ON e.id = p.employeeId JOIN Zone z ON p.zoneId = z.id JOIN user_building ub ON USING (buildingID) WHERE ub.username ='" + username+ "'";
    }


    db.fetchData(query, function(err, zones) {

        if (err) {
            return next(err);
        }
        return res.json(zones);
    });

};

router.get('/:resource/:id', processGetRequest);
router.get('/:resource', processGetRequest);





module.exports = router;
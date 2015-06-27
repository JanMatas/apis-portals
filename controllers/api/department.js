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

    var endpoint = "department";
    colNames = apiUtils.getColumnNames(req, "department");
    if (colNames === undefined) {
        return res.sendStatus(400);
    }

    if (id) {
        query = "SELECT "+ colNames.join()+ " FROM department d JOIN user_building ub USING (buildingID) JOIN building b ON b.id = ub.buildingID WHERE ub.username ='" + username+ "' AND d.id =" + id;

    } else {
        query = "SELECT "+ colNames.join()+ " FROM department d JOIN user_building ub USING (buildingID) JOIN building b ON b.id = ub.buildingID WHERE ub.username ='" + username+ "'";
    }


    db.fetchData(query, function(err, zones) {

        if (err) {
            return next(err);
        }
        return res.json(zones);
    });

};

router.get('/:departmentId', processGetRequest);
router.get('/', processGetRequest);




module.exports = router;
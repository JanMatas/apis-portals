var router = require('express').Router();
var db = require('../../db');
var authUtils = require('../../authUtils');
var apiUtils = require('./apiUtils');


router.get('/:empId', processGetRequest);
router.get('/', processGetRequest);




module.exports = router;


function processGetRequest(req, res, next) {
    // Get all available field names from config file

    var requestedFields;

    // Try to get ID, if undefined, it returns all visible employees
    id = req.params.empId;

    // Get username from auth headers
    var username = authUtils.authReq(req);

    if (username === undefined) {
        // Not authenticated, return unauthorized
        return res.sendStatus(401);
    }

    colNames = apiUtils.getColumnNames(req, "emp");
    if (colNames === undefined) {
        res.sendStatus(400);
    }

    // Create query
    if (id) {
        sql = "SELECT " + colNames.join() + " FROM Employee e JOIN Department d ON e.departmentId = d.id JOIN user_building ub using (buildingId) WHERE ub.username ='" + username + "' and e.id = " + id;
    } else {
        sql = "SELECT " + colNames.join() + " FROM Employee e JOIN Department d ON e.departmentId = d.id JOIN user_building ub using (buildingId) WHERE ub.username ='" + username + "'";
    }

    // Fetch data from DB
    db.fetchData(sql, function(err, rows) {

        if (err) {
            return res.send(500, err);
        }
        
        
        return res.json(rows);
    });

}
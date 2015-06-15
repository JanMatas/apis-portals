var router = require('express').Router();
var db = require('../../db');
var config = require('../../config');
var authUtils = require('../../authUtils');
var apiConfig = require('./config');
var mysql = require('mysql');
var _ = require('lodash');


router.get('/:empId', processGetRequest);
router.get('/', processGetRequest);




module.exports = router;


function processGetRequest(req, res, next) {
    // Get all available field names from config file
    availableFields = Object.keys(apiConfig.availableFields.emp);
    var requestedFields;

    // Try to get ID, if undefined, it returns all visible employees
    id = req.params.empId;

    // Get username from auth headers
    var username = authUtils.authReq(req);

    if (username === undefined) {
        // Not authenticated, return unauthorized
        return res.sendStatus(401);
    }

    if (req.query.fields) {

        // Split the request query string to get requested fields
        requestedFields = req.query.fields.split(",");

        // Check if all the requested fields are available
        if ((_.difference(requestedFields, availableFields))) {
            // Send bad request if not
            return res.sendStatus(400);
        }

    } else {

        requestedFields = [];
    }


    // Get the union of of requested and default fields
    requestedFields = _.union(requestedFields, apiConfig.defaultFields.emp);
    colNames = [];

    // Create alliasing for the API fields
    requestedFields.forEach(function(element) {
        colNames.push(apiConfig.availableFields.emp[element] + " AS " + element);

    });

    // Create query
    if (id) {
        sql = "SELECT " + colNames.join() + " FROM Employee e JOIN Department d ON e.departmentId = d.id JOIN user_building ub using (buildingId) WHERE ub.username ='" + username + "' and e.id = " + id;
    } else {
        sql = "SELECT " + colNames.join() + " FROM Employee e JOIN Department d ON e.departmentId = d.id JOIN user_building ub using (buildingId) WHERE ub.username ='" + username + "'";
    }

    // Fetch data from DB
    db.fetchData(query, function(err, zones) {

        if (err) {
            return res.send(500, err);
        }
        
        
        return res.json(zones);
    });

}
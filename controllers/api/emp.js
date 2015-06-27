var router = require('express').Router();
var db = require('../../db');
var config = require('../../config');
var authUtils = require('../../authUtils');
var apiConfig = require('./config');
var mysql = require('mysql');
var apiUtils = require('./apiUtils');

var squel = require('squel');

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
    var fields = apiUtils.getFields(req, "emp");
    
    if (username === undefined) {
        // Not authenticated, return unauthorized
        return res.sendStatus(401);
    }

    if (fields === undefined) {
        return res.sendStatus(400);
    }


    var s = squel.select()
        .fields(fields)
        .from("sys_user")
        .join("sys_employment", null, "sys_user.pk_ = sys_employment.sys_user_pk_")
        .join("sys_employmenttype", null, "sys_employmenttype.pk_ = sys_employment.sys_employmenttype_pk_")
        .join("sys_company", null, "sys_company.pk_ = sys_employmenttype.sys_company_pk_")
        .join("sys_ostr", null, "sys_employment.sys_ostr_pk_ = sys_ostr.pk_");



    console.log(s.toString());



    // Fetch data from DB
    db.fetchData(s.toString(), function(err, rows) {

        if (err) {
            return res.send(500, err);
        }


        return res.json(rows);
    });

}
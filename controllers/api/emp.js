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
        // His employment
        .join("sys_employment", null, "sys_user.pk_ = sys_employment.sys_user_pk_")
        // Employment type
        .join("sys_employmenttype", null, "sys_employmenttype.pk_ = sys_employment.sys_employmenttype_pk_")
        // Company
        .join("sys_company", null, "sys_company.pk_ = sys_employmenttype.sys_company_pk_")
        // Department
        .join("sys_ostr", null, "sys_employment.sys_ostr_pk_ = sys_ostr.pk_")
        
        // Find employee permissions
        .join("por_user_permission", "emp_permission", "sys_user.pk_ = emp_permission.sys_user_pk_")
        .join("sys_user", "user", "user.loginname = '" + username + "'")      
        .join("por_user_permission", "user_permission", "user.pk_ = user_permission.sys_user_pk_")
        .order("sys_user.pk_")
        .where("user_permission.sys_area_pk_ = emp_permission.sys_area_pk_");

        
    if(apiUtils.hasField("allowedZones",req)) {
        
        console.log("allowedZones");
    }


    if (id) {
        s.where("sys_user.pk_ = " + id);
    }





    // Fetch data from DB
    db.fetchData(s.toString(), function(err, rows) {

        if (err) {
            return next(err);
        }


        return res.json(rows);
    });

}


function processPutRequest(req, resp, next) {

}

function processPostRequest(req, resp, next) {

     
}
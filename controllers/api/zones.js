var router = require('express').Router();
var db = require('../../db');
var config = require('../../config');
router.get('/', function(req, res, next) {
    if (config.authenticate) {
        if (!req.auth) {
            return res.send(401);
        }
    }
    query = "SELECT * FROM Zone";
    db.fetchData(query, function(err, zones) {

        if (err) {
            return res.send(500, err);
        }
        return res.json(zones);
    });

});

module.exports = router;
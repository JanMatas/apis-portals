var mysql      = require('mysql');

var config = require('./config');

var pool = mysql.createPool(config.db);



var getConnection = function(callback) {
    pool.getConnection(function(err, connection) {
        callback(err, connection);
    });
};

module.exports = getConnection;
var mysql = require('mysql');

//TODO connections are not actually pooling because of HEROKU timeouts - needs solution

// Loads db configuration from config.js
var config = require('./config');

// Initializes the connection pool
var pool = mysql.createPool(config.db);


/* 	Returns a connection from the pool, takes callback to 
	the function to be executed */

var getConnection = function(callback) {
    var mysql      = require('mysql');
    var connection = mysql.createConnection(config.db);

    connection.connect(function(err) {
        callback(err, connection);
    });
};


var executeQuery = function(query, cb) {
    getConnection(function(err, connection) {
        // handle errors
        if (err) {
            
            cb(err, undefined);
            return;
        }
        connection.on('error', function(err) {
            connection.destroy();
            cb(err, undefined);
            return;
        });

        connection.query(query, function(err, rows) {
            connection.destroy();
            cb(err, rows);
        });

    });

};

module.exports = {
    getConnection: getConnection,
    fetchData: executeQuery, //TODO remove this
    executeQuery : executeQuery
};
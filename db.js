var mysql = require('mysql');

// Loads db configuration from config.js
var config = require('./config');

// Initializes the connection pool
var pool = mysql.createPool(config.db);


/* 	Returns a connection from the pool, takes callback to 
	the function to be executed */
var getConnection = function(callback) {
    pool.getConnection(function(err, connection) {
        callback(err, connection);
    });
};


var executeQuery = function(query, cb) {
    getConnection(function(err, connection) {
        // handle errors
        if (err) {
            connection.release();
            cb(err, data)
            return;
        }
        connection.on('error', function(err) {
            connection.release();
            cb(err, data)
            return;
        });

        connection.query(query, function(err, rows) {
            connection.release();
            cb(err, rows);
        });

    })

}

module.exports = {
    connection: getConnection,
    fetchData: executeQuery, //TODO remove this
    executeQuery: executeQuery
}
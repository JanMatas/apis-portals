var mysql      = require('mysql');

var config = require('./config');

var pool = mysql.createPool(config.db);



var getConnection = function(callback) {
    pool.getConnection(function(err, connection) {
        callback(err, connection);
    });
};

var fetchData = function(query, cb) {
		getConnection( function (err, connection) {
		// handle errors
		if (err) {
			connection.release();
			cb(err, data)
			return;
		}
		connection.on('error', function(err) {   
			cb(err, data)
            return;   
        });

		connection.query(query,function(err,rows){
            connection.release();
			cb(err, rows);
        });

	})

}

module.exports = {
	connection : getConnection,
	fetchData : fetchData
}

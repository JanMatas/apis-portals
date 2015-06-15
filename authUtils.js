var config = require('./config');
var jwt = require('jwt-simple');

var authReq = function (req) {
    var user;
	if (config.authenticate) {
		if (!req.auth) {
            return undefined;
        }
        var token = req.headers['x-auth'];

        user = jwt.decode(token, config.secret);

    } else {
        user = {};
   		user.username = 'jm6214';
    }
    return user.username;
};

module.exports = {
	authReq : authReq
};
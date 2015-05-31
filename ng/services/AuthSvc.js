app.factory('AuthSvc', function($http) {
    var currentUser = null;
    var loggedIn = false;
    var token = null;
    var role = "admin";

    // initMaybe it wasn't meant to work for mpm?ial state says we haven't logged in or out yet...
    // this tells us we are in public browsing
    var initialState = true;

    return {
        initialState: function() {
            return initialState;
        },
        login: function(username, password) {

            return $http.post('api/session', {
                username: username,
                password: password
            }).then(function(val) {
            	
            	console.log('emmited')
            	currentUser = username;
            	loggedIn = true;
                token = val.data;
                $http.defaults.headers.common['X-Auth'] = val.data;
                

 
            })
        },
        logout: function() {
            currentUser = null;
            authorized = false;
        },
        isLoggedIn: function() {
            return loggedIn;
        },
        currentUser: function() {
            return currentUser;
        },
        isAuthorized: function(roles) {
            return roles.indexOf(role) >= 0 || roles.indexOf("*") >= 0;
        }
    };
})
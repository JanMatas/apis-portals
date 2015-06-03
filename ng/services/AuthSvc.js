app.factory('AuthSvc', function($http, $cookies) {
    var currentUser = null;
    var loggedIn = false;
    var token = null;
    var role =  null;

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
            	
                $cookies.username = username
                $cookies.token = val.data
                $cookies.isLoggedIn = 1
            	currentUser = username;
            	loggedIn = true;
                token = val.data;
                role = "admin"
                $cookies.role = role;
                $http.defaults.headers.common['X-Auth'] = val.data;
                

 
            })
        },
        logout: function() {
            $cookies.username = null
            $cookies.token = null
            $cookies.isLoggedIn = null
            $cookies.role = null
            currentUser = null;
            authorized = false;
            token = null;
            role = null;
            loggedIn = false;

        },
        isLoggedIn: function() {
            if ($cookies.isLoggedIn == 1) {
                loggedIn = true;
                token = $cookies.token;
                $http.defaults.headers.common['X-Auth'] = token;
                currentUser = $cookies.username;
                role = $cookies.role;

            }
            return loggedIn;
        },
        currentUser: function() {
            return currentUser;
        },
        isAuthorized: function(roles) {
            
            return this.isLoggedIn() && roles.indexOf(role) >= 0 || roles.indexOf("*") >= 0;
            
        }
    };
})
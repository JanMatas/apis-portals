// Routing for frontend
// It associates a controller and a partial view to the
// given route
app.config(function($routeProvider) {
    $routeProvider
        .when('/', {
            // TODO - decide on entry view
            controller: 'MapCtrl',
            templateUrl: 'map.html'
        })
        .when('/map', {
            // Map view
            controller: 'MapCtrl',
            templateUrl: 'map.html'
        })
        .when('/zones', {
        	// Zones list view
            controller: 'ZonesCtrl',
            templateUrl: 'zones.html'
        })
        .when('/employees', {
        	// Employee list view
            controller: 'EmpGridCtrl',
            templateUrl: 'emp_grid.html'
        })
        .when('/profile/:empId', {
        	// Employee profile view
            controller: 'EmpProfileCtrl',
            templateUrl: 'profile.html'
        })
        .otherwise({
        	// Not implemented
            templateUrl: 'notImplemented.html'
        })
})
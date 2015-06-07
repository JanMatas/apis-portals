// Routing for frontend
// It associates a controller and a partial view to the
// given route
app.config(function($routeProvider, USER_ROLES) {
    $routeProvider
        .when('/', {
            // TODO - decide on entry view
            controller: 'LoginCtrl',
            templateUrl: 'login.html',
            data : {
                authorizedRoles: [USER_ROLES.all]
            }
        })

        .when('/map', {
            // Map view
            controller: 'MapCtrl',
            templateUrl: 'map.html',
            data : {
                authorizedRoles: [USER_ROLES.admin, USER_ROLES.editor]
            }
        })
        .when('/zones', {
        	// Zones list view
            controller: 'ZonesCtrl',
            templateUrl: 'zones.html',
            data : {
                authorizedRoles: [USER_ROLES.admin, USER_ROLES.editor]
            }
        })
        .when('/employees', {
        	// Employee list view
            controller: 'EmpGridCtrl',
            templateUrl: 'emp_grid.html',
            data : {
                authorizedRoles: [USER_ROLES.admin, USER_ROLES.editor]
            }
        })
        .when('/profileSettings/:empId', {
        	// Employee profile view
            controller: 'EmpSettingsCtrl',
            templateUrl: 'profileSettings.html',
            data : {
                authorizedRoles: [USER_ROLES.admin]
            }
        })
        .when('/profile/:empId', {
            // Employee profile view
            controller: 'EmpProfileCtrl',
            templateUrl: 'profile.html',
            data : {
                authorizedRoles: [USER_ROLES.admin]
            }
        })
        .otherwise({
        	// Not implemented
            templateUrl: 'notImplemented.html',
            data : {
                authorizedRoles: [USER_ROLES.all]
            }

        })
})
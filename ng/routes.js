app.config(function ($routeProvider) {
	$routeProvider
		.when('/', {controller: 'MapCtrl', templateUrl: 'map.html'})
		.when('/map', {controller: 'MapCtrl', templateUrl: 'map.html'})
		.when('/zones', {controller: 'ZonesCtrl', templateUrl: 'zones.html'})
		.when('/employees', {controller: 'EmpGridCtrl', templateUrl: 'emp_grid.html'})
		.when('/profile/:empId', {controller: 'EmpProfileCtrl', templateUrl: 'profile.html'})
		.otherwise({controller: 'MapCtrl', templateUrl: 'map.html'})
})

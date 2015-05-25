app.service('EmpSvc', function($http) {
	this.fetch = function() {
		
		return $http.get('/api/employees')
	}
})
app.service('ZonesSvc', function($http) {
	this.fetch = function() {
		return $http.get('/api/zones')
	}
})
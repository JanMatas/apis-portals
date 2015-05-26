app.service('MapSvc', function($http) {
	this.fetch = function(buildingId) {
		
		return $http.get('/api/map?buildingID='+buildingId)
	}
})







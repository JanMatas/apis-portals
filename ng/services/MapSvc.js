app.service('MapSvc', function($http) {
	this.fetch = function(buildingId) {
		
		return $http.get('/api/map?buildingID='+buildingId)
	}

	this.save = function(nodePositions) {
		return $http.post('api/map', {
			nodePositions: nodePositions
		})
	}
})







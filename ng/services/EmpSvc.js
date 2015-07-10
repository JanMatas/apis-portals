app.service('EmpSvc', function($http) {
    this.fetch = function(id) {
        return $http.get('/api/employee/' + id + '?fields=department,email,phone');
    };

    this.create = function(data) {

    	return $http.post('/api/employee', data);
    };

    this.update = function(data) {
    	return $http.put('/api/employee/' + data.id, data);
    };
});
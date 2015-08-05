app.service('EmpSvc', function($http) {
    this.fetchEmp = function(id) {

    	console.log("id  : "  + id);
        return $http.get('/api/employee/' + id + '?fields=department,email,phone,allowedZones,departmentId,tagNumber');
    };

    this.create = function(data) {

    	return $http.post('/api/employee', data);
    };

    this.update = function(data) {

    	return $http.put('/api/employee/' + data.id, data);
    };
});
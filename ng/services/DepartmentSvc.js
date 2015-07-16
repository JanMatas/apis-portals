app.service('DepartmentSvc', function($http) {
    this.fetch = function(id) {
        return $http.get('/api/employee/' + id + '?fields=department,email,phone,allowedZones');
    };

});
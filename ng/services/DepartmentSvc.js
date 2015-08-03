app.service('DepartmentSvc', function($http) {
    this.fetch = function(id) {
        return $http.get('/api/department/');
    };

});
app.service('EmpGridSvc', function($http) {
    this.fetch = function() {
        return $http.get('/api/employee?fields=department');
    };
});
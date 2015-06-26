app.service('EmpSettingsSvc', function($http) {
    this.fetchEmployee = function(id) {
        return $http.get('/api/employee/' + id + '?fields=departmentId,email,phone,validFrom');
    };

    this.fetchDepartments  = function() {
    	return $http.get('/api/department');
    };

    this.fetchPermissions = function() {

    };
});
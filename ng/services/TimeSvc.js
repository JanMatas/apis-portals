app.service('TimeSvc', function($http) {
    this.fetch = function(startDate, endDate, empId) {

        return $http.get('/api/time?startDate=' + startDate + '&endDate=' + endDate + '&employeeId=' + empId);
    };
});

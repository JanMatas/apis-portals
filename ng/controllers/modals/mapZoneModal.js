app.controller('MapZoneModalInstance', function($scope, $modalInstance, $location, $http, node, label) {
    $scope.name = label;
    $scope.isEmp = true;
    $http.get('/api/positionInfo/zone?zoneId=' + node).success(function(data) {
        $scope.emps = [];
        for (x in data) {
            $scope.emps.push({
                id: data[x].id,
                firstname: data[x].firstname,
                lastname: data[x].lastname,
                img: '/images/emps/' + data[x].id + '.jpg'
            })
        }
        $scope.isEmp = $scope.emps.length != 0;
    })
    $scope.cancel = function() {
        $modalInstance.dismiss('cancel');
    };
    $scope.profile = function(empId) {
        $modalInstance.dismiss('cancel');
        $location.path('/profile/' + empId);
    }

});
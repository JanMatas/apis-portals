app.controller('MapZoneModalInstance', function($scope, $modalInstance, $location, $http, $rootScope, node, label) {
    $scope.name = label;
    $scope.isEmp = true;
    $scope.ready = false;
    $http.get('/api/zone/' + node).success(function(data) {
        $scope.emps = [];
        $scope.ready = true;
        for (var x in data) {

            $scope.emps.push({
                id: data[x].employeeId,
                firstname: data[x].firstname,
                lastname: data[x].lastname,
                img: '/images/emps/' + data[x].employeeId + '.jpg'
            });
        }
        $scope.isEmp = $scope.emps.length !== 0;
    });

    $scope.$on("modal.closing" ,function () {

        cy.nodes().unselect();
    });

    $scope.cancel = function() {

        $modalInstance.dismiss('cancel');
    };
    $scope.profile = function(empId) {
        $modalInstance.dismiss('cancel');
        $location.path('/profile/' + empId);
    };

});
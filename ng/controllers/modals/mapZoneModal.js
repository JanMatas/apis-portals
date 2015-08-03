app.controller('MapZoneModalInstance', function($scope, $modalInstance, $location, $http, $rootScope, node, label) {
    $scope.name = label;
    $scope.isEmp = true;
    $http.get('/api/positionInfo/zone?zoneId=' + node).success(function(data) {
        $scope.emps = [];
        for (var x in data) {
            $scope.emps.push({
                id: data[x].id,
                firstname: data[x].firstname,
                lastname: data[x].lastname,
                img: '/images/emps/' + data[x].id + '.jpg'
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
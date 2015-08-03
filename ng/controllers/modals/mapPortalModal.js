app.controller('MapPortalModalInstance', function($scope, $location, $modalInstance, $http, label, node) {
    $scope.ready = false;
    $http.get('/api/transaction/portal/' + node + '?limit=5').success(function(data) {
        $scope.ready = true;
        $scope.transactions = [];
        for (var x in data) {
            $scope.transactions.push({
                empId: data[x].employeeId,
                firstname: data[x].firstname,
                lastname: data[x].lastname,
                img: '/images/emps/' + data[x].employeeId + '.jpg',
                date: data[x].timestamp * 1000
            });
        }
        $scope.isTrans = $scope.transactions.length !== 0;

    });


    $scope.name = label;
    $scope.connection = "Established"; // TODO implement this
    $scope.status = "Armed"; //TODO implement this

    $scope.armed = true;

    $scope.$on("modal.closing", function() {

        cy.nodes().unselect();
    });
    $scope.arm = function() {
        $scope.status = "Armed";
        $scope.armed = true;
    };

    $scope.disarm = function() {
        $scope.status = "DisArmed";
        $scope.armed = false;
    };

    $scope.changeConfig = function() {
        $modalInstance.dismiss('cancel');
        $window.location.href = '/#/options';
    };

    $scope.cancel = function() {

        $modalInstance.dismiss('cancel');
    };
    $scope.profile = function(empId) {
        $modalInstance.dismiss('cancel');
        $location.path('/profile/' + empId);
    };

});

var createDate = function(timestamp) {
    var t = timestamp.split(/[- :]/);
    var d = new Date(t[0], t[1] - 1, t[2], t[3], t[4], t[5]);
    return d;
};
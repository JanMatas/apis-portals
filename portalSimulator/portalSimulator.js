var app = angular.module('app', []);

app.service('TransactionSvc', function($http) {
    this.save = function(transaction) {
        return $http.post('/api/portal_endpoint/transaction', {
            transaction: transaction
        });
    };
});


app.service('EmpSvc', function($http) {
    this.fetch = function(id) {
        return $http.get('/api/employee/');
    };
});



app.service('PortalSvc', function($http) {
    this.fetch = function(id) {
        return $http.get('/api/portal/');
    };
});

app.controller('AppCtrl', function($scope, PortalSvc, EmpSvc, TransactionSvc) {

    $scope.direction = "In";
    PortalSvc.fetch().success(function(data) {
        $scope.portals = data;
        $scope.selectedPortal = data[0].id;
    });

    EmpSvc.fetch().success(function(data) {

        $scope.employees = data;
        $scope.selectedEmployee = data[0].id;
    });

    $scope.connect = function() {
        //TODO implement hearthbeats
        console.log("Connected");
        $scope.isConnected = true;
    };

    $scope.disconnect = function() {
        console.log("Disconnected");
        $scope.isConnected = false;
    };

    $scope.save = function() {
        var transaction = {
            employeeId: $scope.selectedEmployee,
            portalId: $scope.selectedPortal,
            timestamp: Date.now(),
            direction: $scope.direction
        };
        console.log(transaction);
        TransactionSvc.save(transaction).success(function(data) {
            console.log(data);
        });
    };
});
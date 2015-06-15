var app = angular.module('app', []);

app.service('PortalSvc', function($http) {
    this.save = function(transaction) {
        return $http.post('/api/transaction', {
            transaction: transaction
        });
    };
});

app.controller('AppCtrl', function($scope, PortalSvc) {

    $scope.buildingId = 1;
    $scope.portalId = 1;

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
            buildingId: $scope.buildingId,
            employeeId: $scope.employeeId,
            portalId: $scope.portalId,
            alarm: $scope.alarm,
            timestamp: Date.now(),
            direction: $scope.direction
        };
        PortalSvc.save(transaction);
    };
});
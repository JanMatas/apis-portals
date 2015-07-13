app.controller('ZonesCtrl', function($scope, ZonesSvc) {

    $scope.panelReady = function() {
        console.log($scope.selectedZone.id);
    };

    $scope.zoneChange = function() {
        ZonesSvc.fetchTransactions($scope.selectedZone.id).success(function(data) {
        $scope.zoneTransactions = data;   
        console.log(data);
        });
    };
});
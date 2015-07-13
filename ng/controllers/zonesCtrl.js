app.controller('ZonesCtrl', function($scope) {
    $scope.panelReady = function() {

        console.log($scope.selectedZone.id);
    
    };

    $scope.zoneChange = function() {
        //TODO reload data
    };
});
app.controller('ZonesCtrl', function($scope, ZonesSvc) {
    $scope.zones = [];
    $scope.selectedZone = null;
    ZonesSvc.fetch().success(function(data) {


        $scope.zones = data;
        $scope.totalItems = $scope.zones.length;
        $scope.selectedZone = data[0];
    });




});
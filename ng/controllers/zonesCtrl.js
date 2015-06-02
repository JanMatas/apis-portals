app.controller('ZonesCtrl', function($scope, ZonesSvc) {
    $scope.oneAtATime = true;

    $scope.groups = [

    ];
    ZonesSvc.fetch().success(function(data) {

        for (x in data) {
            $scope.groups.push({
                title: data[x].name,
                content: data[x].description
            })
        }
    })
    $scope.zoneFilter = '';
});
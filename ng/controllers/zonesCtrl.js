app.controller('ZonesCtrl', function($scope, ZonesSvc) {
    $scope.oneAtATime = true;
$scope.example_treedata = []
    $scope.groups = [

    ];
    ZonesSvc.fetch().success(function(data) {


        $scope.example_treedata = data;
        for (var x in data) {
            $scope.groups.push({
                title: data[x].name,
                content: data[x].description
            });
        }
    });
    $scope.zoneFilter = '';
});
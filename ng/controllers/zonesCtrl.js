app.controller('ZonesCtrl', function($scope, ZonesSvc, lodash) {
    $scope.viewPersons = true;
    $scope.fromTime = null;
    $scope.toTime = null;
    $scope.panelReady = false;
    console.log($scope.toTime)
    $scope.panelReadyCallback = function() {
        console.log($scope.selectedZone.id);
        $scope.zoneChangeCallback()
    };

    $scope.zoneChangeCallback = function() {
        $scope.zoneTransactions = null;

        $scope.transactions = null;
        ZonesSvc.fetchTransactions($scope.selectedZone.id, moment($scope.fromTime).unix(), moment($scope.toTime).unix()).success(function(data) {


            console.log(data);
            var result = lodash.chain(data)
                .groupBy("employeeId")
                .pairs()
                .map(function(currentItem) {
                    return lodash.object(lodash.zip(["employeeId", "entries"], currentItem));
                })
                .value();


            $scope.zoneTransactions = result;

            $scope.transactions = data;


        });

    };


});
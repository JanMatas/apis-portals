app.controller('ZonesCtrl', function($scope, ZonesSvc, lodash) {
    $scope.viewPersons = true;
    $scope.fromTime = null;
    $scope.toTime  = null;
    console.log($scope.toTime)
    $scope.panelReady = function() {
        console.log($scope.selectedZone.id);
        $scope.zoneChange()
    };

    $scope.zoneChange = function() {
        
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
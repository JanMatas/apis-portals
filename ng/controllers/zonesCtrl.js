app.controller('ZonesCtrl', function($scope, ZonesSvc, lodash) {
    $scope.viewPersons = true;
    $scope.panelReady = function() {
        console.log($scope.selectedZone.id);
        $scope.zoneChange()
    };

    $scope.zoneChange = function() {
        
        ZonesSvc.fetchTransactions($scope.selectedZone.id).success(function(data) {
            
           

                var result = lodash.chain(data)
                    .groupBy("employeeId")
                    .pairs()
                    .map(function(currentItem) {
                        return lodash.object(lodash.zip(["employeeId", "entries"], currentItem));
                    })
                    .value();

                console.log(result);
                $scope.zoneTransactions = result;
          
                $scope.transactions = data;
            

        });

    };
});
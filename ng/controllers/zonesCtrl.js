app.controller('ZonesCtrl', function($scope, ZonesSvc, PortalSvc, lodash) {
    $scope.viewPersons = true;
    $scope.fromTime = null;
    $scope.toTime = null;
    $scope.panelReady = false;
    $scope.showZones = false;


    var processTransactionData = function(data) {
        console.log(data)
        var result = lodash.chain(data)
            .groupBy("employeeId")
            .pairs()
            .map(function(currentItem) {
                return lodash.object(lodash.zip(["employeeId", "entries"], currentItem));
            })
            .value();


        $scope.personTransactions = result;

        $scope.transactions = data;
    }

    $scope.zoneChangeCallback = function(zone) {
        $scope.selectedZone = zone
        $scope.zoneTransactions = null;
        $scope.transactions = null;
        ZonesSvc.fetchTransactions(zone.id, moment($scope.fromTime).unix(),
            moment($scope.toTime).unix()).success(function(data) {


            processTransactionData(data);


        });



    };

    $scope.portalChangeCallback = function(portal) {
        $scope.selectedPortal = portal
        $scope.zoneTransactions = null;
        $scope.transactions = null;
        PortalSvc.fetchTransactions($scope.selectedPortal.id, moment($scope.fromTime).unix(),
            moment($scope.toTime).unix()).success(function(data) {
            processTransactionData(data);
        });


    };

    PortalSvc.fetch().success(function(data) {
        $scope.portals = data
        $scope.portalChangeCallback(data[0])

    })






});

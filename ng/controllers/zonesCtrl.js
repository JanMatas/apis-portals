app.controller('ZonesCtrl', function($scope, ZonesSvc, PortalSvc, lodash) {
    $scope.viewPersons = true;
    $scope.fromTime = null;
    $scope.toTime = null;
    $scope.panelReady = false;
    $scope.showZones = false;


    var processTransactionData = function(data) {
        data = lodash.map(data, function(entry) {
            console.log(entry)
            if (entry.firstname == null) {
                entry.firstname = 'Not'
            }
            if (entry.lastname == null) {
                entry.lastname = 'recorded'
            }
            if (entry.employeeId == null) {
                entry.photo = '/images/placeholders/placeholder.png'
            } else {
                entry.photo = '/images/emps/' + entry.employeeId + '.jpg'
            }
            if (entry.direction == 'in') {
                entry.destination = entry.zoneToName
            } else  {
                entry.destination = entry.zoneFromName
            }
            console.log(entry)
            return entry

        })
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

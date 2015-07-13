app.controller('zoneTreeCtrl', function($scope, $filter, EmpSvc, ZonesSvc, $routeParams) {

    /* 
        Control of zones tree renderer
    */

    $scope.zones = [];

    ZonesSvc.fetch().success(function(data) {
        $scope.zones = data;
        $scope.$parent.zones = $scope.zones;
        $scope.$parent.selectedZone = data[0];
        $scope.$parent.panelReady();

    });


    $scope.zoneFilter = '';

    $scope.selectZone = function(zone) {


        $scope.$parent.selectedZone = zone;
        $scope.$parent.zoneChange();
    };
    $scope.toggleZone = function(zone) {
        zone.showChildren = !zone.showChildren;
    };

    $scope.togglePermission = function(zone) {
        // change the permission of all children
        changeChildrenPermissions(zone, zone.permission);
        $scope.$parent.zones = $scope.zones;

    };

    function hideChildren() {
        for (var zone in $scope.zones) {
            mapTree($scope.zones[zone], function(zone) {
                zone.showChildren = false;
            });
        }
    }


    var hideAll = function() {
        for (var zone in $scope.zones) {
            mapTree($scope.zones[zone], function(zone) {
                zone.hidden = true;

            });
        }
    };

    $scope.filter = function() {

        hideAll();
        for (var zone in $scope.zones) {
            filterTree($scope.zones[zone]);
        }
        if ($scope.zoneFilter === '') {

            hideChildren();
        }
    };

    // Hides everything, that is not on the path to a node matching filter
    function filterTree(root) {
        var result = false;

        for (var i = 0; i < root.children.length; i++) {
            if (filterTree(root.children[i])) {
                result = true;
            }
        }
        root.showChildren = result;
        result = result || root.label.toLowerCase().indexOf($scope.zoneFilter.toLowerCase()) > -1;
        if (result) {
            root.hidden = false;
        }
        return result;
    }

    function changeChildrenPermissions(zone, permission) {
        mapTree(zone, function(zone) {
            zone.permission = permission;
        });
    }

    function mapTree(root, func) {
        func(root);
        for (var i = 0; i < root.children.length; i++) {
            mapTree(root.children[i], func);
        }
    }

    function mapZones(zones, func) {
        for (var i in zones) {
            mapZones(zones[i], func);
        }
    }
});
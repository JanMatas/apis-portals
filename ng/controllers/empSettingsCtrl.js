app.controller('EmpSettingsCtrl', function($scope, $filter, EmpSvc, ZonesSvc, DepartmentSvc, $routeParams) {

    $scope.id = "toggle-" + 1;
    $scope.zones = [];

    EmpSvc.fetchEmp($routeParams.empId).success(function(data) {
        $scope.emp = {
            id: data[0].id,
            firstname: data[0].firstname,
            lastname: data[0].lastname,
            img: '/images/emps/' + data[0].id + '.jpg',
            email: data[0].email,
            phone: data[0].phone,
            gender: "Male",
            department: data[0].department,
            validFrom: data[0].validFrom,
            tagNumber: data[0].tagNumber,
            allowedZones: data[0].allowedZones
        };

        ZonesSvc.fetch().success(function(data) {
            $scope.zones = data;
            mapZones($scope.zones, function(zone) {

                zone.permission = $scope.emp.allowedZones.indexOf(zone.id) >= 0;

            });
        });

    });

    DepartmentSvc.fetch().success(function(data) {
        $scope.zones = data;
        mapZones($scope.zones, function(zone) {

            zone.permission = $scope.emp.allowedZones.indexOf(zone.id) >= 0;

        });
    });


    function getAllowedZones() {
        var allowedZones = [];
        mapZones($scope.zones, function(zone) {
            if (zone.permission) {
                allowedZones.push(zone.id);
            }
        });
        return allowedZones;
    }

    $scope.saveData = function() {



        //EmpSvc.put($scope.emp);
    };



    $scope.zoneFilter = '';

    $scope.selectZone = function(zone) {


        $scope.$parent.selectedZone = zone;
        //$scope.$parent.zoneChange();
    };
    $scope.toggleZone = function(zone) {
        zone.showChildren = !zone.showChildren;
    };

    $scope.togglePermission = function(zone) {
        // change the permission of all children
        changeChildrenPermissions(zone, zone.permission);
        //$scope.$parent.zones = $scope.zones;

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
            mapTree(zones[i], func);
        }
    }

});
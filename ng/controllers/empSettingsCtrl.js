app.controller('EmpSettingsCtrl', function($scope, $filter, $window, Upload, EmpSvc, ZonesSvc, DepartmentSvc, $routeParams) {
    $scope.alerts = [];



    $scope.closeAlert = function(index) {
        $scope.alerts.splice(index, 1);
    };


    $scope.id = "toggle-" + 1;
    $scope.zones = [];
    DepartmentSvc.fetch().success(function(data) {
        $scope.departments = data;
    });
    // Put some image on until the page loads
    $scope.emp = {
        img: 'images/placeholders/placeholder.png'
    }
    if ($routeParams.empId == 'new') {
        ZonesSvc.fetch().success(function(data) {
            $scope.zones = data;
        });

    } else {
        EmpSvc.fetchEmp($routeParams.empId).success(function(data) {
            console.log(data);
            $scope.emp = {
                id: data[0].id,
                firstname: data[0].firstname,
                lastname: data[0].lastname,
                img: '/images/emps/' + data[0].id + '.jpg',
                email: data[0].email,
                phone: data[0].phone,
                gender: "Male",
                department: data[0].departmentId,
                validFrom: data[0].validFrom,
                validTo: data[0].validTo,
                tagNumber: data[0].tagNumber,
                allowedZones: data[0].allowedZones,

            };

            ZonesSvc.fetch().success(function(data) {
                $scope.zones = data;
                mapZones($scope.zones, function(zone) {
                    zone.permission = $scope.emp.allowedZones.indexOf(zone.id) >= 0;

                });
            });
        });
    }


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

        var fieldsToCheck = ["phone", "email", "firstname", "lastname", "department", "tagNumber", "allowedZones"];
        var wrongField = false;
        $scope.emp.allowedZones = getAllowedZones()

        for (var f in fieldsToCheck) {
            if (!$scope.emp[fieldsToCheck[f]]) {
                $scope.alerts.push({
                    type: 'danger',
                    msg: 'You forgot to enter ' + fieldsToCheck[f] + "."
                });
                wrongField = true;

            }
        }

        if ($scope.emp.allowedZones.length === 0) {
            $scope.alerts.push({
                type: 'danger',
                msg: 'Employee must have permission to enter at least one zone'
            });
            wrongField = true;
        }


        if (!wrongField) {
            $scope.emp.allowedZones = [];
            mapZones($scope.zones, function(zone) {
                if(zone.permission) {
                    $scope.emp.allowedZones.push(zone.id);
                }
            });
            var uploadObject = {


                data: $scope.emp,
                file: $scope.file
            }

            if (!$scope.emp.id) {
                uploadObject.url= '/api/employee/'
                uploadObject.method = 'POST'
            } else {
                uploadObject.url= '/api/employee/' + $scope.emp.id,
                uploadObject.method = 'PUT'
            }
            console.log(uploadObject)
            up = Upload.upload(uploadObject).success(function (data, status, headers, config) {
            console.log("data")
             $window.location = "/#/employees"
        }).error(function (data, status, headers, config) {
            if (data == "ER_DUP_ENTRY") {
                $scope.alerts.push({
                    type: 'danger',
                    msg: 'Tag ID already used .'
                });
            } else {
                alert(data)
            }
        })


           

        }

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
        result = result || root.name.toLowerCase().indexOf($scope.zoneFilter.toLowerCase()) > -1;
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

app.controller('EmpSettingsCtrl', function($scope, EmpSettingsSvc, ZonesSvc, $routeParams) {
    $scope.totalItems = 0;
    $scope.itemsPerPage = 3;
    $scope.zonesReady = true;
    $scope.id = "toggle-" + 1;



    EmpSettingsSvc.fetchEmployee($routeParams.empId).success(function(data) {
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
            tagNumber: 75497502384
        };


    });


    EmpSettingsSvc.fetchDepartments().success(function(data) {
        $scope.departments = data;
    });

    $scope.zones = [];
    ZonesSvc.fetch().success(function(data) {
        for (var x in data) {
            $scope.zones.push({
                title: data[x].name,

            });

        }

        $scope.totalItems = $scope.zones.length;

    });

    $scope.zoneFilter = '';

    $scope.currentPage = 0;
});
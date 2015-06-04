app.controller('EmpSettingsCtrl', function($scope, EmpSvc, ZonesSvc, $routeParams) {
    $scope.totalItems = 50;
    $scope.itemsPerPage = 5;
    $scope.zonesReady = false;
    $scope.id = "toggle-" + 1;
    EmpSvc.fetch().success(function(data) {

        for (x in data) {

            if (data[x].id == $routeParams.empId) {

                $scope.emp = {
                    id: data[x].id,
                    firstname: data[x].firstname,
                    lastname: data[x].lastname,
                    img: '/images/emps/' + data[x].id + '.jpg',
                    email: data[x].email,
                    phone: data[x].phone,
                    gender: data[x].firstname,
                    department: data[x].department,
                    validFrom: data[x].validFrom,

                }
            }

        }

    })
    var zones = []
    ZonesSvc.fetch().success(function(data) {

        for (x in data) {
            zones.push({
                title: data[x].name,

            })

        }

        $scope.totalItems = data.length;
        if ($scope.totalItems > 0) {
            $scope.zonesReady = true;
        }
        $scope.zones = zones.slice(($scope.currentPage - 1) * $scope.itemsPerPage, $scope.currentPage * $scope.itemsPerPage);
    })

    $scope.zoneFilter = '';
    $scope.pageChanged = function() {
        $scope.zones = zones.slice(($scope.currentPage - 1) * $scope.itemsPerPage, $scope.currentPage * $scope.itemsPerPage)    
    };
    $scope.currentPage = 1;



});
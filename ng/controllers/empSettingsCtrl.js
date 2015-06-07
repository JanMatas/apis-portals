app.controller('EmpSettingsCtrl', function($scope, EmpSvc, ZonesSvc, $routeParams) {
    $scope.totalItems = 0
    $scope.itemsPerPage = 3;
    $scope.zonesReady = true;
    $scope.id = "toggle-" + 1;
    $scope.departments = ["Marketing", "Catalogue of currencies"]

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
                    gender: "Male",
                    department: data[x].department,
                    validFrom: data[x].validFrom,
                    tagNumber: 75497502384
                }
            }

        }

    })
    $scope.zones = []
    ZonesSvc.fetch().success(function(data) {

        for (x in data) {
            $scope.zones.push({
                title: data[x].name,

            })

        }
        
        $scope.totalItems = $scope.zones.length
    
    })
    
    $scope.zoneFilter = '';

    $scope.currentPage = 0;



});
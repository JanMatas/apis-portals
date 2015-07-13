app.controller('EmpSettingsCtrl', function($scope, $filter, EmpSvc, ZonesSvc, $routeParams) {

    $scope.id = "toggle-" + 1;


    EmpSvc.fetch($routeParams.empId).success(function(data) {
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
            tagNumber: data[0].tagNumber
        };

    });


    $scope.saveData = function () {
        console.log($scope.zones);
        //EmpSvc.put($scope.emp);
    };


});
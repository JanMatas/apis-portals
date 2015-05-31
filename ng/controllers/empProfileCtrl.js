app.controller('EmpProfileCtrl', function($scope, EmpSvc, $routeParams) {

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

});
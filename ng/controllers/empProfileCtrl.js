app.controller('EmpProfileCtrl', function($scope, EmpSvc, TimeSvc, AuthSvc, $routeParams) {

    $scope.showConfig = AuthSvc.isAdmin();
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

    TimeSvc.fetch('2015-01-30', '2015-08-10', $routeParams.empId).success( function(data) {
    
        $scope.labels2 = []
        $scope.data2 = []

        
        for (d in data) {
            $scope.labels2.push(data[d].name)
            $scope.data2.push(data[d].timeSum)
        }

    });

    $scope.labels = ["January", "February", "March", "April", "May", "June", "July"];
    $scope.series = ['Series A', 'Series B'];
    $scope.data = [
        [65, 59, 80, 81, 56, 55, 40],
        [28, 48, 40, 19, 86, 27, 90]
    ];



    //TODO fix this
    $scope.select2 = function() {

        $scope.chartTab2Show = true;
    };
    $scope.deselect2 = function() {
   
        $scope.chartTab2Show = false;
    };
    $scope.select = function() {
        $scope.chartTabShow = true;
    };
    $scope.deselect = function() {
        $scope.chartTabShow = false;
    };



});
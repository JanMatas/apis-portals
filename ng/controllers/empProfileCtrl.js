app.controller('EmpProfileCtrl', function($scope, EmpSvc, TimeSvc, AuthSvc, $routeParams) {

    $scope.showConfig = AuthSvc.isAdmin();
    EmpSvc.fetchEmp($routeParams.empId).success(function(data) {
        $scope.emp = {
            id: data[0].id,
            firstname: data[0].firstname,
            lastname: data[0].lastname,
            img: '/images/emps/' + data[0].id + '.jpg',
            email: data[0].email,
            phone: data[0].phone,
            gender: data[0].firstname,
            department: data[0].department,


        };
    });

    TimeSvc.fetch('2015-01-30', '2015-08-10', $routeParams.empId).success(function(data) {

        $scope.labels2 = [];
        $scope.data2 = [];


        for (var d in data) {
            $scope.labels2.push(data[d].name);
            $scope.data2.push(data[d].timeSum);
        }

    });

    $scope.labels = ["January", "February", "March", "April", "May", "June", "July"];
    $scope.series = ['Series A', 'Series B'];
    $scope.data = [
        [65, 59, 80, 81, 56, 55, 40],
        [28, 48, 40, 19, 86, 27, 90]
    ];

    $scope.chartTabShow = true;

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
app.controller('EmpGridCtrl', function($scope, EmpGridSvc) {
    $scope.departments = [];
    $scope.departmentFilter = "";
    $scope.employeeFilter = "";
    var splitIntoDepartments = function(emps) {
        var department = [];
        for (var x in emps) {

            if (department[emps[x].department] === undefined) {
                department[emps[x].department] = [];
            }
            department[emps[x].department].push({
                id: emps[x].id,
                firstname: emps[x].firstname,
                lastname: emps[x].lastname,
                img: '/images/emps/' + emps[x].id + '.jpg'
            });
        }
        return department;
    };

    EmpGridSvc.fetch().success(function(data) {
        $scope.ready=true;
        var departments = splitIntoDepartments(data);
        for (var d in departments) {
            $scope.departments.push({
                department: d,
                emps: departments[d]
            });
        }
    });
    EmpGridSvc.fetch().error(function(err) {
        console.log(err)
        
    });

});

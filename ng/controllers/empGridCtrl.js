app.controller('EmpGridCtrl', function($scope, EmpSvc) {


    $scope.departments = []

    var splitIntoDepartments = function(emps) {
        var department = [];
        for (x in emps) {

            if (department[emps[x].department] === undefined) {
                department[emps[x].department] = [];
            }
            department[emps[x].department].push({
                id: emps[x].id,
                firstname: emps[x].firstname,
                lastname: emps[x].lastname,
                img: '/images/emps/' + emps[x].id + '.jpg'
            })
        }
        return department;
    }

    EmpSvc.fetch().success(function(data) {
        var departments = splitIntoDepartments(data)
        for (d in departments) {
            $scope.departments.push({
                department: d,
                emps: departments[d]
            })


        }
        console.log($scope.departments);
    })
});
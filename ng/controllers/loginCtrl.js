app.controller('LoginCtrl', function($scope,$location, $rootScope, AuthSvc) {


    $scope.loggedIn = AuthSvc.isLoggedIn();
    if ($scope.loggedIn) {
        $location.path('/map')
    }
    $scope.currentUser = AuthSvc.currentUser();
    $rootScope.$on('login', function(event) {
        $scope.currentUser = AuthSvc.currentUser();
        $scope.loggedIn = AuthSvc.isLoggedIn();
    });

    $scope.alerts = [];



    $scope.closeAlert = function(index) {
        $scope.alerts.splice(index, 1);
    };

    $scope.ok = function() {
        AuthSvc.login($scope.username, $scope.password)
            .then(function(response) {
                

                $rootScope.$emit('login');
                $location.path('/map')
            }, function(error) {
                $scope.alerts = [{
                    type: 'danger',
                    msg: 'Oh snap! You have probably entered wrong username and password.'
                }];
            });
        

    };


});


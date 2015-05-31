app.controller('ModalDemoCtrl', function($scope, $rootScope, $modal, AuthSvc) {

    $scope.items = ['item1', 'item2', 'item3'];
    $scope.loggedIn = AuthSvc.isLoggedIn();
    $scope.currentUser = AuthSvc.currentUser();
    $rootScope.$on('login', function(event) {
        $scope.currentUser = AuthSvc.currentUser();
        $scope.loggedIn = AuthSvc.isLoggedIn();
    });



    $scope.open = function() {

        var modalInstance = $modal.open({
            templateUrl: 'modals/loginModal.html',
            controller: 'LoginModalInstance',
        });
    };

});


app.controller('LoginModalInstance', function($scope, $rootScope, $modalInstance, AuthSvc) {
    $scope.alerts = [];



    $scope.closeAlert = function(index) {
        $scope.alerts.splice(index, 1);
    };

    $scope.ok = function() {
        AuthSvc.login($scope.username, $scope.password)
            .then(function(response) {
                $rootScope.$emit('login');
                $modalInstance.close();

            }, function(error) {
                $scope.alerts = [{
                    type: 'danger',
                    msg: 'Oh snap! You have probably entered wrong username and password.'
                }];
            });


    };
    $scope.cancel = function() {
        $modalInstance.dismiss('cancel');
    };
});
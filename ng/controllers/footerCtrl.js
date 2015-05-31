app.controller('FooterCtrl', function($scope,$rootScope, AuthSvc) {
    $scope.loggedIn = AuthSvc.isLoggedIn();
    $rootScope.$on('login', function(event) {
        $scope.loggedIn = AuthSvc.isLoggedIn();
        console.log("login detected in footer" + $scope.loggedIn)
    });
});
app.controller('NavbarCtrl', function($scope,$rootScope, $location, AuthSvc) {
    $scope.loggedIn = AuthSvc.isLoggedIn();
    $rootScope.$on('login', function(event) {
        $scope.loggedIn = AuthSvc.isLoggedIn();
        $scope.currentUser = AuthSvc.currentUser();
    });
    $rootScope.$on('logout', function(event) {
        $scope.loggedIn = AuthSvc.isLoggedIn();
    });
    $scope.currentUser = AuthSvc.currentUser();
    $scope.logout = function() {
    	AuthSvc.logout();
    	$rootScope.$emit('logout');
    	$location.path('/')
    }
});
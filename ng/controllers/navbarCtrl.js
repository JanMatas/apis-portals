app.controller('NavbarCtrl', function($scope,$rootScope, $http, $route, $location, AuthSvc) {
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
    

    $scope.updateBuilding = function (building) {

        AuthSvc.setArea(building)
        $route.reload();
    }
    $http.get('/api/building').success(function(data) {
        $scope.buildings = data
        $scope.building = {}
        $scope.building.id = data[0].id;
    })
});

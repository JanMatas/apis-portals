app.run(function($rootScope, $location, AuthSvc) {

    $rootScope.$on('$routeChangeStart', function(event, next) {
        if (!next.$$route) { //Routing to not found always allowed
            return;
        }
        var authorizedRoles = next.$$route.data.authorizedRoles;
        
        if (!AuthSvc.isAuthorized(authorizedRoles)) {
            event.preventDefault();

            if (AuthSvc.isLoggedIn()) {

                console.log('DENY');
                
            } else {

                console.log('NOT LOGGED IN');
            }
        }
    });
});
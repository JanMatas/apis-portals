app.run(function($rootScope, $location, AuthSvc, CONFIG) {

    $rootScope.$on('$routeChangeStart', function(event, next) {
        if(CONFIG.auth) {
            try {
                authorizedRoles = next.$$route.data.authorizedRoles;
            }
            catch(err) {
                //accessing unrestricted address
                console.log("accessing unrestricted address")
                return;
            }

        
            if (!AuthSvc.isAuthorized(next.$$route.data.authorizedRoles)) {
                

                if (!AuthSvc.isLoggedIn()) {
                    event.preventDefault();
                    alert("You need to login before accesing this path")
                    $location.path('/')
                    
                } else {
                    event.preventDefault();
                    alert("You dont have permissions to access this path")
                    $location.path('/')

                }
            }
        }
    });
});
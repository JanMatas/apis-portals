//Frontend entry point
var app = angular.module('app', ['ngRoute', 'chart.js', 'ui.bootstrap', 'ngCookies','toggle-switch', 'angularBootstrapNavTree']);

app.run(function($rootScope, $location, AuthSvc, CONFIG) {

    $rootScope.$on('$routeChangeStart', function(event, next) {
        if (CONFIG.auth) {
            try {
                authorizedRoles = next.$$route.data.authorizedRoles;
            } catch (err) {
                //accessing unrestricted address

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
app.constant('USER_ROLES', {
  all: '*',
  admin: 'admin',
  editor: 'editor',
  guest: 'guest'
})

app.constant('CONFIG', {
	auth: true
})
// Routing for frontend
// It associates a controller and a partial view to the
// given route
app.config(function($routeProvider, USER_ROLES) {
    $routeProvider
        .when('/', {
            // TODO - decide on entry view
            controller: 'LoginCtrl',
            templateUrl: 'login.html',
            data : {
                authorizedRoles: [USER_ROLES.all]
            }
        })

        .when('/map', {
            // Map view
            controller: 'MapCtrl',
            templateUrl: 'map.html',
            data : {
                authorizedRoles: [USER_ROLES.admin, USER_ROLES.editor]
            }
        })
        .when('/zones', {
        	// Zones list view
            controller: 'ZonesCtrl',
            templateUrl: 'zones.html',
            data : {
                authorizedRoles: [USER_ROLES.admin, USER_ROLES.editor]
            }
        })
        .when('/employees', {
        	// Employee list view
            controller: 'EmpGridCtrl',
            templateUrl: 'emp_grid.html',
            data : {
                authorizedRoles: [USER_ROLES.admin, USER_ROLES.editor]
            }
        })
        .when('/profileSettings/:empId', {
        	// Employee profile view
            controller: 'EmpSettingsCtrl',
            templateUrl: 'profileSettings.html',
            data : {
                authorizedRoles: [USER_ROLES.admin]
            }
        })
        .when('/profile/:empId', {
            // Employee profile view
            controller: 'EmpProfileCtrl',
            templateUrl: 'profile.html',
            data : {
                authorizedRoles: [USER_ROLES.admin]
            }
        })
        .otherwise({
        	// Not implemented
            templateUrl: 'notImplemented.html',
            data : {
                authorizedRoles: [USER_ROLES.all]
            }

        })
})
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
        var departments = splitIntoDepartments(data);
        for (var d in departments) {
            $scope.departments.push({
                department: d,
                emps: departments[d]
            });


        }

    });
    

});

app.controller('EmpProfileCtrl', function($scope, EmpProfileSvc, TimeSvc, AuthSvc, $routeParams) {

    $scope.showConfig = AuthSvc.isAdmin();
    EmpProfileSvc.fetch($routeParams.empId).success(function(data) {
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
app.controller('EmpSettingsCtrl', function($scope, $filter, EmpSettingsSvc, ZonesSvc, $routeParams) {
    $scope.totalItems = 0;
    $scope.itemsPerPage = 3;
    $scope.zonesReady = true;
    $scope.id = "toggle-" + 1;


    EmpSettingsSvc.fetch($routeParams.empId).success(function(data) {
        $scope.emp = {
            id: data[0].id,
            firstname: data[0].firstname,
            lastname: data[0].lastname,
            img: '/images/emps/' + data[0].id + '.jpg',
            email: data[0].email,
            phone: data[0].phone,
            gender: "Male",
            department: data[0].department,
            validFrom: data[0].validFrom,
            tagNumber: 75497502384
        };

    });

    $scope.zones = [];

    ZonesSvc.fetch().success(function(data) {


        $scope.zones = data;
        $scope.totalItems = $scope.zones.length;

    });

    $scope.toggleZone = function(zone) {
        zone.showChildren = !zone.showChildren;
    };

    $scope.togglePermission = function(zone) {
        // change the permission of all children
        changeChildrenPermissions(zone, zone.permission);
    };



    $scope.zoneFilter = '';
    $scope.currentPage = 0;


    /* 
        Control of zones tree renderer
    */
    function hideChildren() {
        for (var zone in $scope.zones) {
            mapTree($scope.zones[zone], function(zone) {
                zone.showChildren = false;
            });
        }
    }


    var hideAll = function() {
        for (var zone in $scope.zones) {
            mapTree($scope.zones[zone], function(zone) {
                zone.hidden = true;

            });
        }
    };

    $scope.filter = function() {

        hideAll();
        for (var zone in $scope.zones) {
            filterTree($scope.zones[zone]);
        }
        if ($scope.zoneFilter === '') {

            hideChildren();
        }
    };

    // Hides everything, that is not on the path to a node matching filter
    function filterTree(root) {
        var result = false;
        
        for (var i = 0; i < root.children.length; i++) {
            if (filterTree(root.children[i])) {
                result = true;
            }
        }
        root.showChildren = result;
        result = result || root.label.toLowerCase().indexOf($scope.zoneFilter.toLowerCase()) > -1;
        if (result) {
            root.hidden = false;
        }
        return result;
    }

    function changeChildrenPermissions(zone, permission) {
        mapTree(zone, function(zone) {
            zone.permission = permission;
        });
    }

    function mapTree(root, func) {
        func(root);
        for (var i = 0; i < root.children.length; i++) {
            mapTree(root.children[i], func);
        }

    }
});
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


//Offset of portal node
var PORTAL_NODE_OFFSET = 10000;

/** This is the controller for the map on home screen*/
app.controller('MapCtrl', function($scope, $modal, MapSvc, AuthSvc) {

    var nodeIds = [];
    var colors = {
        zone: '#E14F3F',
        portal: {
            disarmed: '#83FFFF',
            armed: '#CCFF99',
            disconnected: '#E6E6E6'
        }
    }

    $scope.configuration = true
    var createData = function(createNetwork) {
        console.log(AuthSvc.getArea())
        MapSvc.fetch(AuthSvc.getArea()).success(function(data) {
            //$scope.mapReady = true;
            var nodes = [];
            var edges = [];

            for (n in data.zones) {
                nodeIds.push(data.zones[n].id)
                if (data.zones[n].map_x === null || data.zones[n].map_x === null) {
                    nodes.push({
                        id: data.zones[n].id,
                        label: data.zones[n].name,
                        physics: true,
                        color: colors.zone,
                        shape: 'box'
                    })


                } else {
                    nodes.push({
                        id: data.zones[n].id,
                        label: data.zones[n].name,
                        x: data.zones[n].map_x,
                        y: data.zones[n].map_y,
                        color: colors.zone,
                        shape: 'box'
                    })

                }
            }
            for (p in data.portals) {
                nodeIds.push(data.portals[p].id + PORTAL_NODE_OFFSET);
                var color;
                switch (data.portals[p].status) {
                    case "disconnected":
                        color = colors.portal.disconnected;
                        break;
                    case "armed":
                        color = colors.portal.armed;
                        break;
                    case "disarmed":
                        color = colors.portal.disarmed;
                        break;
                }

                if (data.portals[p].map_x === null || data.portals[p].map_x === null) {
                    nodes.push({
                        id: data.portals[p].id + PORTAL_NODE_OFFSET,
                        label: data.portals[p].name,
                        physics: true,
                        color: color


                    })

                } else {
                    nodes.push({
                        id: data.portals[p].id + PORTAL_NODE_OFFSET,
                        label: data.portals[p].name,
                        x: data.portals[p].map_x,
                        y: data.portals[p].map_y,
                        color: color


                    })

                }
                edges.push({

                    from: data.portals[p].zoneFrom,
                    to: data.portals[p].id + PORTAL_NODE_OFFSET,
                    color: '#E6E6E6'

                })

                edges.push({

                    from: data.portals[p].id + PORTAL_NODE_OFFSET,
                    to: data.portals[p].zoneTo,
                    color: '#E6E6E6'
                })

            }


            createNetwork(nodes, edges, nodeIds);

        })

    }

    var createNetwork = function(nodes, edges, nodeIds) {
        var nodesDataSet = new vis.DataSet(nodes)

        var edgesDataSet = new vis.DataSet(edges);
        var container = document.getElementById('mynetwork');




        var data = {
            nodes: nodesDataSet,
            edges: edgesDataSet
        };

        options = {

            interaction: {
                dragView: false,
                zoomView: false,
                selectConnectedEdges: false
            },

            nodes: {
                physics: false
            },
            edges: {
                smooth: true
            }
        }

        var network = new vis.Network(container, data, options);
        $scope.network = network;
        $scope.nodesDataSet = nodesDataSet;
        $scope.edgesDataSet = edgesDataSet;

        network.on('click', function(properties) {

            if (properties.nodes.length != 0) {
                if (properties.nodes <= PORTAL_NODE_OFFSET) {
                    var modalInstance = $modal.open({

                        templateUrl: 'modals/mapZoneModal.html',
                        controller: 'MapZoneModalInstance',
                        size: 'lg',
                        resolve: {
                            node: function() {

                                return properties.nodes[0];
                            },
                            label: function() {

                                return nodesDataSet.get(properties.nodes)[0].label;
                            }
                        }
                    });

                } else {
                    var modalInstance = $modal.open({
                        templateUrl: 'modals/mapPortalModal.html',
                        controller: 'MapPortalModalInstance',
                        size: 'lg',
                        resolve: {
                            label: function() {

                                return nodesDataSet.get(properties.nodes)[0].label;
                            },

                            node: function() {
                                return properties.nodes[0] - PORTAL_NODE_OFFSET;
                            }
                        }
                    });
                }

            }
        });

        network.on('stabilized', function() {

            for (n in nodeIds) {

                $scope.nodesDataSet.update([{
                    id: nodeIds[n],
                    physics: false
                }]);
            }
        })


    }

    createData(createNetwork)

    var temp = [];

    $scope.saveConfig = function() {
        nodesPositions = $scope.network.getPositions();
        MapSvc.save(nodesPositions);

    }

    $scope.rearrange = function() {
        $scope.network.setOptions({

            edges: {
                smooth: true
            }

        })

        for (n in nodeIds) {

            $scope.nodesDataSet.update([{
                id: nodeIds[n],
                x : 0,
                y : 0,
                physics: true
            }]);
        }

        $scope.network.on('stabilized', function() {

            $scope.network.setOptions({

                edges: {
                    smooth: false
                }
            })
            for (n in nodeIds) {

                $scope.nodesDataSet.update([{
                    id: nodeIds[n],

                    physics: false
                }]);
            }
        })

        console.log("test")

    }



});
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

app.controller('ZonesCtrl', function($scope, ZonesSvc) {
    $scope.zones = [];
    $scope.selectedZone = null;
    ZonesSvc.fetch().success(function(data) {


        $scope.zones = data;
        $scope.totalItems = $scope.zones.length;
        $scope.selectedZone = data[0];
    });

    $scope.toggleZone = function(zone) {
        zone.showChildren = !zone.showChildren;
    };

    $scope.togglePermission = function(zone) {
        // change the permission of all children
        changeChildrenPermissions(zone, zone.permission);
    };



    $scope.zoneFilter = '';
    $scope.currentPage = 0;

    var hideAll = function() {
        for (var zone in $scope.zones) {
            mapTree($scope.zones[zone], function(zone) {
                zone.hidden = true;

            });
        }
    };

    function hideChildren() {
        for (var zone in $scope.zones) {
            mapTree($scope.zones[zone], function(zone) {
                zone.showChildren = false;
            });
        }
    }

    $scope.filter = function() {

        hideAll();
        for (var zone in $scope.zones) {
            filterTree($scope.zones[zone]);
        }
        if ($scope.zoneFilter === '') {

            hideChildren();
        }
    };

    $scope.selectZone = function(zone) {
        $scope.selectedZone = zone;

    };

    // Hides everything, that is not on the path to a node matching filter
    function filterTree(root) {
        var result = false;
        
        for (var i = 0; i < root.children.length; i++) {
            if (filterTree(root.children[i])) {
                result = true;
            }
        }
        root.showChildren = result;
        result = result || root.label.toLowerCase().indexOf($scope.zoneFilter.toLowerCase()) > -1;
        if (result) {
            root.hidden = false;
        }
        return result;
    }

    function changeChildrenPermissions(zone, permission) {
        mapTree(zone, function(zone) {
            zone.permission = permission;
        });
    }

    function mapTree(root, func) {
        func(root);
        for (var i = 0; i < root.children.length; i++) {
            mapTree(root.children[i], func);
        }

    }



});
app.directive('onErrorSrc', function() {
    return {
        link: function(scope, element, attrs) {
          element.bind('error', function() {
            if (attrs.src != attrs.onErrorSrc) {
              attrs.$set('src', attrs.onErrorSrc);
            }
          });
        }
    }
});
app.filter('offset', function() {
  return function(input, start) {
    start = parseInt(start, 10);
    return input.slice(start);
  };
});
app.factory('AuthSvc', function($http, $cookies) {
    var currentUser = null;
    var loggedIn = false;
    var token = null;
    var role =  null;
    var area = 1;

    // initMaybe it wasn't meant to work for mpm?ial state says we haven't logged in or out yet...
    // this tells us we are in public browsing
    var initialState = true;

    return {
        isAdmin: function() {
            return role == "admin";
        },
        initialState: function() {
            return initialState;
        },
        login: function(username, password) {

            return $http.post('api/session', {
                username: username,
                password: password
            }).then(function(val) {
            	
                $cookies.username = username
                $cookies.token = val.data
                $cookies.isLoggedIn = 1
            	currentUser = username;
            	loggedIn = true;
                token = val.data;
                role = "admin"
                $cookies.role = role;
                $http.defaults.headers.common['X-Auth'] = val.data;
                

 
            })
        },
        logout: function() {
            $cookies.username = null
            $cookies.token = null
            $cookies.isLoggedIn = null
            $cookies.role = null
            currentUser = null;
            authorized = false;
            token = null;
            role = null;
            loggedIn = false;

        },
        isLoggedIn: function() {
            if ($cookies.isLoggedIn == 1) {
                loggedIn = true;
                token = $cookies.token;
                $http.defaults.headers.common['X-Auth'] = token;
                currentUser = $cookies.username;
                role = $cookies.role;

            }
            return loggedIn;
        },
        currentUser: function() {
            return currentUser;
        },
        isAuthorized: function(roles) {
            
            return this.isLoggedIn() && roles.indexOf(role) >= 0 || roles.indexOf("*") >= 0;
            
        },
        getArea : function() {
            return area
        },
        setArea : function(newArea) {
            area = newArea;
        }


    };
})
app.service('EmpGridSvc', function($http) {
    this.fetch = function() {
        return $http.get('/api/employee?fields=department');
    };
});
app.service('EmpProfileSvc', function($http) {
    this.fetch = function(id) {
        return $http.get('/api/employee/' + id + '?fields=department,email,phone');
    };
});
app.service('EmpSettingsSvc', function($http) {
    this.fetch = function(id) {
        return $http.get('/api/employee/' + id + '?fields=department,email,phone');
    };
});
app.service('MapSvc', function($http) {
    this.fetch = function(buildingId) {
    	console.log('/api/map?buildingID=' + buildingId)
        return $http.get('/api/map?buildingID=' + buildingId)
    }
    this.save = function(nodePositions) {
        return $http.post('api/map', {
            nodePositions: nodePositions
        })
    }
})

app.service('TimeSvc', function($http) {
    this.fetch = function(startDate, endDate, empId) {

        return $http.get('/api/time?startDate=' + startDate + '&endDate=' + endDate + '&employeeId=' + empId);
    };
});

app.service('ZonesSvc', function($http) {
    this.fetch = function() {
        return $http.get('/api/zone');
    };
});
app.controller('MapPortalModalInstance', function($scope, $location, $modalInstance, $http, label, node) {

    $http.get('/api/transaction?portalId=' + node + '&limit=5').success(function(data) {
        $scope.transactions = [];
        for (var x in data) {
            $scope.transactions.push({
                empId: data[x].employeeId,
                firstname: data[x].firstname,
                lastname: data[x].lastname,
                img: '/images/emps/' + data[x].employeeId + '.jpg',
                date: data[x].timestamp * 1000
            });
        }
        $scope.isTrans = $scope.transactions.length !== 0;

    });


    $scope.name = label;
    $scope.connection = "Established";// TODO implement this
    $scope.status = "Armed";//TODO implement this

    $scope.armed = true;

    $scope.arm = function() {
        $scope.status = "Armed";
        $scope.armed = true;
    };

    $scope.disarm = function() {
        $scope.status = "DisArmed";
        $scope.armed = false;
    };

    $scope.changeConfig = function() {
        $modalInstance.dismiss('cancel');
        $window.location.href = '/#/options';
    };

    $scope.cancel = function() {
        $modalInstance.dismiss('cancel');
    };
    $scope.profile = function(empId) {
        $modalInstance.dismiss('cancel');
        $location.path('/profile/' + empId);
    };

});

var createDate = function(timestamp) {
    var t = timestamp.split(/[- :]/);
    var d = new Date(t[0], t[1] - 1, t[2], t[3], t[4], t[5]);
    return d;
};
app.controller('MapZoneModalInstance', function($scope, $modalInstance, $location, $http, $rootScope, node, label) {
    $scope.name = label;
    $scope.isEmp = true;
    $http.get('/api/positionInfo/zone?zoneId=' + node).success(function(data) {
        $scope.emps = [];
        for (x in data) {
            $scope.emps.push({
                id: data[x].id,
                firstname: data[x].firstname,
                lastname: data[x].lastname,
                img: '/images/emps/' + data[x].id + '.jpg'
            })
        }
        $scope.isEmp = $scope.emps.length != 0;
    })
    $scope.cancel = function() {
        $modalInstance.dismiss('cancel');
    };
    $scope.profile = function(empId) {
        $modalInstance.dismiss('cancel');
        $location.path('/profile/' + empId);
    }

});
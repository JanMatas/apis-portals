//Frontend entry point
var app = angular.module('app', ['ngRoute','angularSpinner','datetimepicker', 'chart.js', 'ui.bootstrap', 'ngCookies','toggle-switch', 'angularBootstrapNavTree', 'ngLodash', 'ngFileUpload'])
					.config([
						'datetimepickerProvider',
						function (datetimepickerProvider) {
							datetimepickerProvider.setOptions({
								locale: 'en'
							});
						}
					]);

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
            controller: 'MapCtrl2',
            templateUrl: 'map2.html',
            data : {
                authorizedRoles: [USER_ROLES.admin, USER_ROLES.editor]
            }
        })
        .when('/transactions', {
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
        .when('/create', {
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

app.controller('EmpProfileCtrl', function($scope, EmpSvc, TimeSvc, AuthSvc, $routeParams) {

    $scope.showConfig = AuthSvc.isAdmin();
    EmpSvc.fetchEmp($routeParams.empId).success(function(data) {
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
app.controller('EmpSettingsCtrl', function($scope, $filter, $window, Upload, EmpSvc, ZonesSvc, DepartmentSvc, $routeParams) {
    $scope.alerts = [];



    $scope.closeAlert = function(index) {
        $scope.alerts.splice(index, 1);
    };


    $scope.id = "toggle-" + 1;
    $scope.zones = [];
    DepartmentSvc.fetch().success(function(data) {
        $scope.departments = data;
    });
    // Put some image on until the page loads
    $scope.emp = {
        img: 'images/placeholders/placeholder.png'
    }
    if ($routeParams.empId == 'new') {
        ZonesSvc.fetch().success(function(data) {
            $scope.zones = data;
        });

    } else {
        EmpSvc.fetchEmp($routeParams.empId).success(function(data) {
            console.log(data);
            $scope.emp = {
                id: data[0].id,
                firstname: data[0].firstname,
                lastname: data[0].lastname,
                img: '/images/emps/' + data[0].id + '.jpg',
                email: data[0].email,
                phone: data[0].phone,
                gender: "Male",
                department: data[0].departmentId,
                validFrom: data[0].validFrom,
                validTo: data[0].validTo,
                tagNumber: data[0].tagNumber,
                allowedZones: data[0].allowedZones,

            };

            ZonesSvc.fetch().success(function(data) {
                $scope.zones = data;
                mapZones($scope.zones, function(zone) {
                    zone.permission = $scope.emp.allowedZones.indexOf(zone.id) >= 0;

                });
            });
        });
    }


    function getAllowedZones() {
        var allowedZones = [];
        mapZones($scope.zones, function(zone) {
            if (zone.permission) {

                allowedZones.push(zone.id);
            }
        });
        return allowedZones;
    }

    $scope.saveData = function() {

        var fieldsToCheck = ["phone", "email", "firstname", "lastname", "department", "tagNumber", "allowedZones"];
        var wrongField = false;
        $scope.emp.allowedZones = getAllowedZones()

        for (var f in fieldsToCheck) {
            if (!$scope.emp[fieldsToCheck[f]]) {
                $scope.alerts.push({
                    type: 'danger',
                    msg: 'You forgot to enter ' + fieldsToCheck[f] + "."
                });
                wrongField = true;

            }
        }

        if ($scope.emp.allowedZones.length === 0) {
            $scope.alerts.push({
                type: 'danger',
                msg: 'Employee must have permission to enter at least one zone'
            });
            wrongField = true;
        }


        if (!wrongField) {
            $scope.emp.allowedZones = [];
            mapZones($scope.zones, function(zone) {
                if(zone.permission) {
                    $scope.emp.allowedZones.push(zone.id);
                }
            });
            var uploadObject = {


                data: $scope.emp,
                file: $scope.file
            }

            if (!$scope.emp.id) {
                uploadObject.url= '/api/employee/'
                uploadObject.method = 'POST'
            } else {
                uploadObject.url= '/api/employee/' + $scope.emp.id,
                uploadObject.method = 'PUT'
            }
            console.log(uploadObject)
            up = Upload.upload(uploadObject).success(function (data, status, headers, config) {
            console.log("data")
             $window.location = "/#/employees"
        }).error(function (data, status, headers, config) {
            if (data == "ER_DUP_ENTRY") {
                $scope.alerts.push({
                    type: 'danger',
                    msg: 'Tag ID already used .'
                });
            } else {
                alert(data)
            }
        })


           

        }

    };



    $scope.zoneFilter = '';

    $scope.selectZone = function(zone) {
        $scope.$parent.selectedZone = zone;
        //$scope.$parent.zoneChange();
    };
    $scope.toggleZone = function(zone) {
        zone.showChildren = !zone.showChildren;
    };

    $scope.togglePermission = function(zone) {
        // change the permission of all children
        changeChildrenPermissions(zone, zone.permission);
        //$scope.$parent.zones = $scope.zones;

    };



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
        result = result || root.name.toLowerCase().indexOf($scope.zoneFilter.toLowerCase()) > -1;
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

    function mapZones(zones, func) {
        for (var i in zones) {
            mapTree(zones[i], func);
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
    };

    $scope.configuration = true;
    var createData = function(createNetwork) {

        MapSvc.fetch(AuthSvc.getArea()).success(function(data) {
            //$scope.mapReady = true;
            var nodes = [];
            var edges = [];

            for (var n in data.zones) {
                nodeIds.push(data.zones[n].id);
                if (data.zones[n].map_x === null || data.zones[n].map_x === null) {
                    nodes.push({
                        id: data.zones[n].id,
                        label: data.zones[n].name,
                        physics: true,
                        color: colors.zone,
                        shape: 'box'
                    });


                } else {
                    nodes.push({
                        id: data.zones[n].id,
                        label: data.zones[n].name,
                        x: data.zones[n].map_x,
                        y: data.zones[n].map_y,
                        color: colors.zone,
                        shape: 'box'
                    });

                }
            }
            for (var p in data.portals) {
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


                    });

                } else {
                    nodes.push({
                        id: data.portals[p].id + PORTAL_NODE_OFFSET,
                        label: data.portals[p].name,
                        x: data.portals[p].map_x,
                        y: data.portals[p].map_y,
                        color: color


                    });

                }
                edges.push({

                    from: data.portals[p].zoneFrom,
                    to: data.portals[p].id + PORTAL_NODE_OFFSET,
                    color: '#E6E6E6',
                    width : 3

                });

                edges.push({

                    from: data.portals[p].id + PORTAL_NODE_OFFSET,
                    to: data.portals[p].zoneTo,
                    color: '#E6E6E6',
                    width : 3
                });

            }


            createNetwork(nodes, edges, nodeIds);

        });

    };

    var createNetwork = function(nodes, edges, nodeIds) {
        var nodesDataSet = new vis.DataSet(nodes);

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
        };

        var network = new vis.Network(container, data, options);
        $scope.network = network;
        $scope.nodesDataSet = nodesDataSet;
        $scope.edgesDataSet = edgesDataSet;

        network.on('click', function(properties) {

            if (properties.nodes.length !== 0) {
                if (properties.nodes <= PORTAL_NODE_OFFSET) {
                    modalInstance = $modal.open({

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
                    modalInstance = $modal.open({
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

            for (var n in nodeIds) {

                $scope.nodesDataSet.update([{
                    id: nodeIds[n],
                    physics: false
                }]);
            }
        });


    };

    createData(createNetwork);

    var temp = [];

    $scope.saveConfig = function() {
        nodesPositions = $scope.network.getPositions();
        MapSvc.save(nodesPositions);

    };

    $scope.rearrange = function() {
        $scope.network.setOptions({

            edges: {
                smooth: true
            }

        });

        for (var n in nodeIds) {

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
            });
            for (var n in nodeIds) {

                $scope.nodesDataSet.update([{
                    id: nodeIds[n],

                    physics: false
                }]);
            }
        });


    };



});
//Offset of portal node
var PORTAL_NODE_OFFSET = 10000;

/** This is the controller for the map on home screen*/
app.controller('MapCtrl2', function($scope, $modal, MapSvc, AuthSvc, $rootScope, $window) {
    $scope.elements = {}
    $scope.elements.nodes = [];
    $scope.elements.edges = [];
    $scope.editing = false;
    $scope.ready = false;
    MapSvc.fetch(AuthSvc.getArea()).success(function(data) {

        for (var n in data.zones) {

            var newNode = {
                group: 'nodes',
                data: {
                    id: 'n' + data.zones[n].id,
                    name: data.zones[n].name,
                    typeShape: "ellipse",
                    typeColor: '#335577'
                },
                position: {
                    x: data.zones[n].map_x + 300,
                    y: data.zones[n].map_y + 300
                },
            };
            $scope.elements.nodes.push(newNode);
        }

        for (var p in data.portals) {
            var newNode = {
                group: 'nodes',
                data: {
                    id: 'p' + data.portals[p].id,
                    name: data.portals[p].name,
                    typeShape: "rectangle",
                    typeColor: '#aaaaaa',

                },
                position: {
                    x: data.portals[p].map_x + 300,
                    y: data.portals[p].map_y + 300
                },

            };

            var edge1 = {
                group: "edges",
                data: {
                    source: 'n' + data.portals[p].zoneFrom,
                    target: 'p' + data.portals[p].id
                }
            };
            $scope.elements.edges.push(edge1);
            var edge2 = {
                group: "edges",
                data: {
                    source: 'p' + data.portals[p].id,
                    target: 'n' + data.portals[p].zoneTo
                }
            };


            $scope.elements.nodes.push(newNode);


            $scope.elements.edges.push(edge2);
        }



        $rootScope.$broadcast('appChanged');

        $scope.ready = true;




    });



    // sample function to be called when clicking on an object in the chart
    $scope.save = function() {

        var nodes = cy.json().elements.nodes;
        var data = [];

        for (var n in nodes) {
            var newData = {
                id: nodes[n].data.id,
                x: nodes[n].position.x,
                y: nodes[n].position.y
            };
            data.push(newData);

        }
        MapSvc.save(data);

        cy.autolock(true);
        $scope.editing = false;


    };
    $scope.edit = function() {
        cy.autolock(false);
        $scope.editing = true;

    };

    $scope.doClick = function(id, label) {


         
        if ($scope.editing) {
            return;
        }
        if (id.charAt() === 'n') {
            modalInstance = $modal.open({

                templateUrl: 'modals/mapZoneModal.html',
                controller: 'MapZoneModalInstance',
                size: 'lg',
                resolve: {
                    node: function() {

                        return id.slice(1);
                    },
                    label: function() {

                        return label;
                    }
                }
            });

        } else {
            modalInstance = $modal.open({
                templateUrl: 'modals/mapPortalModal.html',
                controller: 'MapPortalModalInstance',
                size: 'lg',
                resolve: {
                    node: function() {

                        return id.slice(1);
                    },
                    label: function() {

                        return label;
                    }
                }
            });
        }
    };





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
    	$location.path('/');
    };
    

    $scope.updateBuilding = function (building) {

        AuthSvc.setArea(building.id);

        $route.reload();
    };
    $http.get('/api/building').success(function(data) {
        $scope.buildings = data;
        $scope.building = {};
        $scope.building.id = data[0].id;
    });
});

app.controller('zoneTreeCtrl', function($scope, $filter, EmpSvc, ZonesSvc, $routeParams) {

    /*
        Control of zones tree renderer
    */


    ZonesSvc.fetch().success(function(data) {
        $scope.zones = data;

        $scope.$parent.zoneChangeCallback(data[0])


    });


    $scope.zoneFilter = '';

    $scope.selectZone = function(zone) {



        $scope.$parent.zoneChangeCallback(zone);
    };
    $scope.toggleZone = function(zone) {
        zone.showChildren = !zone.showChildren;
    };

    $scope.togglePermission = function(zone) {
        // change the permission of all children
        changeChildrenPermissions(zone, zone.permission);
        //$scope.$parent.zones = $scope.zones;

    };

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
        result = result || root.name.toLowerCase().indexOf($scope.zoneFilter.toLowerCase()) > -1;
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

    function mapZones(zones, func) {
        for (var i in zones) {
            mapZones(zones[i], func);
        }
    }
});

app.controller('ZonesCtrl', function($scope, ZonesSvc, PortalSvc, lodash) {
    $scope.viewPersons = true;
    $scope.fromTime = null;
    $scope.toTime = null;
    $scope.panelReady = false;
    $scope.showZones = false;


    var processTransactionData = function(data) {
        console.log(data)
        var result = lodash.chain(data)
            .groupBy("employeeId")
            .pairs()
            .map(function(currentItem) {
                return lodash.object(lodash.zip(["employeeId", "entries"], currentItem));
            })
            .value();


        $scope.personTransactions = result;

        $scope.transactions = data;
    }

    $scope.zoneChangeCallback = function(zone) {
        $scope.selectedZone = zone
        $scope.zoneTransactions = null;
        $scope.transactions = null;
        ZonesSvc.fetchTransactions(zone.id, moment($scope.fromTime).unix(),
            moment($scope.toTime).unix()).success(function(data) {
            processTransactionData(data);
        });



    };

    $scope.portalChangeCallback = function(portal) {
        $scope.selectedPortal = portal
        $scope.zoneTransactions = null;
        $scope.transactions = null;
        PortalSvc.fetchTransactions($scope.selectedPortal.id, moment($scope.fromTime).unix(),
            moment($scope.toTime).unix()).success(function(data) {
            processTransactionData(data);
        });

    };

    PortalSvc.fetch().success(function(data) {
        $scope.portals = data
        $scope.portalChangeCallback(data[0])

    })

});

app.directive('cytoscape', function($rootScope) {
    // graph visualisation by - https://github.com/cytoscape/cytoscape.js
    return {
        restrict: 'E',
        template: '<div id="cy"></div>',
        replace: true,
        scope: {
            // data objects to be passed as an attributes - for nodes and edges
            elements: '=',

            // controller function to be triggered when clicking on a node
            cyClick: '&'
        },
        link: function(scope, element, attrs, fn) {

            // graph  build
            scope.doCy = function() { // will be triggered on an event broadcast

                $('#cy').cytoscape({
                    //userZoomingEnabled: false,
                    //userPanningEnabled: false,
                    layout: {
                        name: 'preset',
                        fit: true, // whether to fit the viewport to the graph
                        ready: undefined, // callback on layoutready
                        stop: undefined, // callback on layoutstop
                        padding: 5 // the padding on fit
                    },
                    style: cytoscape.stylesheet()
                        .selector('node')
                        .css({
                            'shape': 'data(typeShape)',
                            'width': '150',
                            'height': '50',
                            'background-color': 'data(typeColor)',
                            'content': 'data(name)',
                            'text-valign': 'center',
                            'color': 'white',
                            'text-outline-width': 2,
                            'text-outline-color': 'data(typeColor)'
                        })
                        .selector('edge')
                        .css({
                            'width': '4',
                            'target-arrow-shape': 'triangle',
                            'source-arrow-shape': 'triangle'
                        })
                        .selector(':selected')
                        .css({
                            'background-color': 'black',
                            'line-color': 'black',
                            'target-arrow-color': 'black',
                            'source-arrow-color': 'black'
                        })

                    .selector('.faded')
                        .css({
                            'opacity': 0.65,
                            'text-opacity': 0.65
                        }),
                    ready: function() {
                        window.cy = this;
                        cy.autolock(true);

                        cy.elements().unselectify();
                        tappedBefore = null;



                        // Event listeners
                        // with sample calling to the controller function as passed as an attribute
                        cy.on('tap', 'node', function(e) {
                            var evtTarget = e.cyTarget;
                            var nodeId = evtTarget.id();

                            setTimeout(function() {
                                tappedBefore = null;
                            }, 100);
                            if (!tappedBefore) {
                                scope.cyClick({
                                    id: evtTarget.id(),
                                    label: evtTarget.json().data.name
                                });
                            }

                            tappedBefore = true;




                        });

                        // load the objects array
                        // use cy.add() / cy.remove() with passed data to add or remove nodes and edges without rebuilding the graph
                        // sample use can be adding a passed variable which will be broadcast on change
                        var jump = function(ele) {

                            x = ele.json()
                                .position.x;
                            y = ele.json()
                                .position.y - 5;

                            ele.animate({

                                position: {
                                    x: x,
                                    y: y
                                },

                            }, {
                                duration: 300
                            });
             
                            y = y + 5;

                            ele.animate({
                                position: {
                                    x: x,
                                    y: y
                                },
                          
                            }, {
                                duration: 300
                            });

                        };
                        cy.load(scope.elements);
                        ele = cy.getElementById("p1");
                        setInterval(function() {

                            jump(ele);

                        }, 1000);





                    }
                });

            }; // end doCy()


            $rootScope.$on('appChanged', function() {
                scope.doCy();
            });
        }
    };
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
app.filter('timestampToDate', function () {
    return function (timestamp) {
        var time = moment.unix(timestamp);
       
        return time.format("DD.MM");
    };
});

app.filter('timestampToTime', function () {
    return function (timestamp) {
        var time = moment.unix(timestamp);
        

        return time.format("hh:mm:ss");
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
app.service('DepartmentSvc', function($http) {
    this.fetch = function(id) {
        return $http.get('/api/department/');
    };

});
app.service('EmpGridSvc', function($http) {
    this.fetch = function() {
        return $http.get('/api/employee?fields=department');
    };
});
app.service('EmpSvc', function($http) {
    this.fetchEmp = function(id) {

    	console.log("id  : "  + id);
        return $http.get('/api/employee/' + id + '?fields=department,email,phone,allowedZones,departmentId,tagNumber');
    };

    this.create = function(data) {

    	return $http.post('/api/employee', data);
    };

    this.update = function(data) {

    	return $http.put('/api/employee/' + data.id, data);
    };

});

app.service('MapSvc', function($http) {
    this.fetch = function(buildingId) {

        return $http.get('/api/map?buildingID=' + buildingId);
    };
    this.save = function(nodePositions) {
        return $http.post('api/map', {
            nodePositions: nodePositions
        });
    };
});

app.service('PortalSvc', function($http) {
    this.fetch = function() {
        return $http.get('/api/portal');
    };
    this.fetchTransactions = function(id, from, to) {
    	var url = '/api/transaction/portal/' + id + '?';
    	if (from) {
    		url = url + "&from=" + from;
    	}
    	if (to) {
    		url = url + "&to=" + to
    	}
        return $http.get(url );
    };
});

app.service('TimeSvc', function($http) {
    this.fetch = function(startDate, endDate, empId) {

        return $http.get('/api/time?startDate=' + startDate + '&endDate=' + endDate + '&employeeId=' + empId);
    };
});

app.service('ZonesSvc', function($http) {
    this.fetch = function() {
        return $http.get('/api/zone');
    };
    this.fetchTransactions = function(id, from, to) {
    	var url = '/api/transaction/zone/' + id + '?';
    	if (from) {
    		url = url + "&from=" + from;
    	}
    	if (to) {
    		url = url + "&to=" + to
    	}
        return $http.get(url );
    };
    
});

app.controller('MapPortalModalInstance', function($scope, $location, $modalInstance, $http, label, node) {
    $scope.ready = false;
    $scope.alarmTab = true;

    $http.get('/api/transaction/portal/' + node + '?limit=5').success(function(data) {
        $scope.ready = true;
        $scope.transactions = [];
        $scope.alarms = [];

        for (var x in data) {
            console.log(data)
            if (data[x].alarm === 'alarm') {
                if (data[x].employeeId === "null") {
                    console.log("£")
                }
                $scope.alarms.push({
                    empId: data[x].employeeId === null ? undefined : data[x].employeeId,
                    firstname: data[x].firstname === null ? "Not" : data[x].firstname,
                    lastname: data[x].lastname === null ? "recorded" : data[x].lastname,
                    img: data[x].employeeId === null ? undefined : '/images/emps/' + data[x].employeeId + '.jpg',
                    date: data[x].timestamp * 1000
                });
            } else {
                $scope.transactions.push({
                    empId: data[x].employeeId,
                    firstname: data[x].firstname,
                    lastname: data[x].lastname,
                    img: '/images/emps/' + data[x].employeeId + '.jpg',
                    date: data[x].timestamp * 1000
                });
            }

        }
        console.log($scope.alarms)
        $scope.isTrans = $scope.transactions.length !== 0;

    });



    $scope.tab = function(type) {
        if (type == "alarms") {
            $scope.alarmTab = true;
        } else {
            $scope.alarmTab = false;
        }
    };
    $scope.name = label;
    $scope.connection = "Established"; // TODO implement this
    $scope.status = "Armed"; //TODO implement this

    $scope.armed = true;

    $scope.$on("modal.closing", function() {

        cy.nodes().unselect();
    });
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
    $scope.ready = false;
    $http.get('/api/zone/' + node).success(function(data) {
        $scope.emps = [];
        $scope.ready = true;
        for (var x in data) {

            $scope.emps.push({
                id: data[x].employeeId,
                firstname: data[x].firstname,
                lastname: data[x].lastname,
                img: '/images/emps/' + data[x].employeeId + '.jpg'
            });
        }
        $scope.isEmp = $scope.emps.length !== 0;
    });

    $scope.$on("modal.closing" ,function () {

        cy.nodes().unselect();
    });

    $scope.cancel = function() {

        $modalInstance.dismiss('cancel');
    };
    $scope.profile = function(empId) {
        $modalInstance.dismiss('cancel');
        $location.path('/profile/' + empId);
    };

});
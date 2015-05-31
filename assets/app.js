//Frontend entry point
var app = angular.module('app', ['ngRoute', 'chart.js', 'ui.bootstrap']);

// Routing for frontend
// It associates a controller and a partial view to the
// given route
app.config(function($routeProvider) {
    $routeProvider
        .when('/', {
            // TODO - decide on entry view
            controller: 'MapCtrl',
            templateUrl: 'map.html'
        })
        .when('/map', {
            // Map view
            controller: 'MapCtrl',
            templateUrl: 'map.html'
        })
        .when('/zones', {
        	// Zones list view
            controller: 'ZonesCtrl',
            templateUrl: 'zones.html'
        })
        .when('/employees', {
        	// Employee list view
            controller: 'EmpGridCtrl',
            templateUrl: 'emp_grid.html'
        })
        .when('/profile/:empId', {
        	// Employee profile view
            controller: 'EmpProfileCtrl',
            templateUrl: 'profile.html'
        })
        .otherwise({
        	// Not implemented
            templateUrl: 'notImplemented.html'
        })
})
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
app.controller('EmpProfileCtrl', function($scope, EmpSvc, $routeParams) {

    EmpSvc.fetch().success(function(data) {
        for (x in data) {

            if (data[x].id == $routeParams.empId) {

                $scope.emp = {
                    id: data[x].id,
                    firstname: data[x].firstname,
                    lastname: data[x].lastname,
                    img: '/images/emps/' + data[x].id + '.jpg',
                    email: data[x].email,
                    phone: data[x].phone,
                    gender: data[x].firstname,
                    department: data[x].department,
                    validFrom: data[x].validFrom,

                }
            }

        }

    })

});
//Offset of portal node
var PORTAL_NODE_OFFSET = 10000;

/** This is the controller for the map on home screen*/
app.controller('MapCtrl', function($scope, $modal, MapSvc) {
    $scope.name = name;
    var createData = function(createNetwork) {

        MapSvc.fetch(1).success(function(data) {

            var nodes = [];
            var edges = [];

            for (n in data.zones) {

                if (data.zones[n].map_x === null || data.zones[n].map_x === null) {
                    nodes.push({
                        id: data.zones[n].id,
                        label: data.zones[n].name,
                        physics: true,
                        mass: 2,
                        value: 100,
                        color: '#E14F3F',
                        shape: 'box',
                        font: {
                            size: 30
                        }

                    })
                } else {
                    nodes.push({
                        id: data.zones[n].id,
                        label: data.zones[n].name,
                        x: data.zones[n].map_x,
                        y: data.zones[n].map_y,

                        mass: 2,
                        color: '#E14F3F',
                        shape: 'box'
                    })

                }
            }
            for (p in data.portals) {

                if (data.portals[p].map_x === null || data.portals[p].map_x === null) {
                    nodes.push({
                        id: data.portals[p].id + PORTAL_NODE_OFFSET,
                        label: data.portals[p].name,
                        physics: true,
                        font: {
                            size: 20
                        },
                        color: '#FFFFA3',

                    })
                } else {
                    nodes.push({
                        id: data.portals[p].id + PORTAL_NODE_OFFSET,
                        label: data.portals[p].name,
                        x: data.portals[p].map_x,
                        y: data.portals[p].map_y,
                        color: '#FFFFA3'

                    })

                }

                edges.push({

                    from: data.portals[p].zoneFrom,
                    to: data.portals[p].id + PORTAL_NODE_OFFSET,

                })

                edges.push({

                    from: data.portals[p].id + PORTAL_NODE_OFFSET,
                    to: data.portals[p].zoneTo,

                })
            }


            createNetwork(nodes, edges);
        })

    }

    var createNetwork = function(nodes, edges) {
        var nodesDataSet = new vis.DataSet(nodes)

        var edgesDataSet = new vis.DataSet(edges);
        var container = document.getElementById('mynetwork');
        var data = {
            nodes: nodesDataSet,
            edges: edgesDataSet
        };

        options = {
            physics: {
                stabilization: false
            },
            nodes: {
                physics: false
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
                            node: function() {
                                return properties.nodes;
                            }
                        }
                    });
                }

            }
        });

        /*
        network.on('stabilized', function() {
            $scope.saveConfig()
            network.setOptions({
                nodes: {
                    fixed: true
                }
            })
        })*/


    }

    createData(createNetwork)

    var temp = [];

    $scope.saveConfig = function() {
        nodesPositions = $scope.network.getPositions();
        MapSvc.save(nodesPositions);

    }


});
app.controller("PieCtrl", function ($scope) {
	$scope.test = "ahoj";
  $scope.labels = ["Download Sales", "In-Store Sales", "Mail-Order Sales"];
  $scope.data = [300, 500, 100];
});


app.controller('ZonesCtrl', function($scope, ZonesSvc) {
    $scope.oneAtATime = true;

    $scope.groups = [

    ];
    ZonesSvc.fetch().success(function(data) {
        console.log(data);
        for (x in data) {
            $scope.groups.push({
                title: data[x].name,
                content: data[x].description
            })
        }
    })
    $scope.zoneFilter = '';
});
app.service('EmpSvc', function($http) {
    this.fetch = function() {
        return $http.get('/api/employees')
    }
})
app.service('MapSvc', function($http) {
    this.fetch = function(buildingId) {

        return $http.get('/api/map?buildingID=' + buildingId)
    }
    this.save = function(nodePositions) {
        return $http.post('api/map', {
            nodePositions: nodePositions
        })
    }
})

app.service('ZonesSvc', function($http) {
    this.fetch = function() {
        return $http.get('/api/zones')
    }
})
app.controller('ModalDemoCtrl', function($scope, $modal, $log) {

    $scope.items = ['item1', 'item2', 'item3'];

    $scope.animationsEnabled = true;

    $scope.open = function(size) {

        var modalInstance = $modal.open({
            animation: $scope.animationsEnabled,
            templateUrl: 'modals/loginModal.html',
            controller: 'ModalInstanceCtrl',
            size: size,
            resolve: {
                items: function() {
                    return $scope.items;
                }
            }
        });

        modalInstance.result.then(function(selectedItem) {
            $scope.selected = selectedItem;
        }, function() {
            $log.info('Modal dismissed at: ' + new Date());
        });
    };

    $scope.toggleAnimation = function() {
        $scope.animationsEnabled = !$scope.animationsEnabled;
    };

});

// Please note that $modalInstance represents a modal window (instance) dependency.
// It is not the same as the $modal service used above.

app.controller('ModalInstanceCtrl', function($scope, $modalInstance, items) {

    $scope.items = items;
    $scope.selected = {
        item: $scope.items[0]
    };

    $scope.ok = function() {
        $modalInstance.close($scope.selected.item);
    };

    $scope.cancel = function() {
        $modalInstance.dismiss('cancel');
    };
});
app.controller('MapPortalModalInstance', function ($scope, $modalInstance, $http) {

  	$scope.cancel = function () {
    	$modalInstance.dismiss('cancel');
  	};
});
app.controller('MapZoneModalInstance', function ($scope, $modalInstance, $http, node, label) {
  	$scope.name = label;
  	$http.get('/api/positionInfo/zone?zoneId='+node).success(function(data){
  		$scope.emps = [];
  		for (x in data) {
	  		$scope.emps.push({
	          id : data[x].id,
	          firstname : data[x].firstname,
	          lastname : data[x].lastname,
	          img : '/images/emps/' + data[x].id + '.jpg' 		
	  		})
  		}
  	})
  	$scope.cancel = function () {
    	$modalInstance.dismiss('cancel');
  	};
});
var app = angular.module('app', ['ngRoute', 'chart.js','ui.bootstrap']);

app.config(function ($routeProvider) {
	$routeProvider
		.when('/', {controller: 'MapCtrl', templateUrl: 'map.html'})
		.when('/map', {controller: 'MapCtrl', templateUrl: 'map.html'})
		.when('/zones', {controller: 'ZonesCtrl', templateUrl: 'zones.html'})
		.when('/employees', {controller: 'EmpGridCtrl', templateUrl: 'emp_grid.html'})
		.when('/profile/:empId', {controller: 'EmpProfileCtrl', templateUrl: 'profile.html'})
		.otherwise({controller: 'MapCtrl', templateUrl: 'map.html'})
})

app.controller('EmpGridCtrl', function ($scope, EmpSvc) {


  $scope.departments = []

  var splitIntoDepartments = function(emps) {
    var department = [];
    for (x in emps) {

      if (department[emps[x].department]  === undefined) {
        department[emps[x].department] = [];
      }
      department[emps[x].department].push({
          id : emps[x].id,
          firstname : emps[x].firstname,
          lastname : emps[x].lastname,
          img : '/images/emps/' + emps[x].id + '.jpg'
      })
    }
    return department;
  }

  EmpSvc.fetch().success(function (data) {
    var departments = splitIntoDepartments(data)
    for (d in departments){
      $scope.departments.push ({
        department : d,
        emps : departments[d]
      })
      
    
    }
    console.log($scope.departments);
    }
  )







});
app.controller('EmpProfileCtrl', function ($scope, EmpSvc, $routeParams) {

  EmpSvc.fetch().success(function (data) {
    for  (x in data) {

      if(data[x].id == $routeParams.empId) {

        $scope.emp = {
          id : data[x].id,
          firstname : data[x].firstname,
          lastname : data[x].lastname,
          img : '/images/emps/' + data[x].id + '.jpg',
          email : data[x].email,
          phone : data[x].phone,
          gender : data[x].firstname,
          department : data[x].department,
          validFrom : data[x].validFrom,

        }
      }

    }
  
    }
  )
  
});
app.controller('ModalDemoCtrl', function ($scope, $modal, $log) {

  $scope.items = ['item1', 'item2', 'item3'];

  $scope.animationsEnabled = true;

  $scope.open = function (size) {

    var modalInstance = $modal.open({
      animation: $scope.animationsEnabled,
      templateUrl: 'myModalContent.html',
      controller: 'ModalInstanceCtrl',
      size: size,
      resolve: {
        items: function () {
          return $scope.items;
        }
      }
    });

    modalInstance.result.then(function (selectedItem) {
      $scope.selected = selectedItem;
    }, function () {
      $log.info('Modal dismissed at: ' + new Date());
    });
  };

  $scope.toggleAnimation = function () {
    $scope.animationsEnabled = !$scope.animationsEnabled;
  };

});

// Please note that $modalInstance represents a modal window (instance) dependency.
// It is not the same as the $modal service used above.

app.controller('ModalInstanceCtrl', function ($scope, $modalInstance, items) {

  $scope.items = items;
  $scope.selected = {
    item: $scope.items[0]
  };

  $scope.ok = function () {
    $modalInstance.close($scope.selected.item);
  };

  $scope.cancel = function () {
    $modalInstance.dismiss('cancel');
  };
});
app.controller('MapCtrl', function ($scope, MapSvc) {
    $scope.name = name;

    var createData = function(createNetwork) {

        MapSvc.fetch(1).success( function (data) {

            var nodes = [];
            var edges = [];
            

            for (n in data.zones) {
 

                if (data.zones[n].map_x === null || data.zones[n].map_x === null) {
                    nodes.push ({
                        id : data.zones[n].id,
                        label : data.zones[n].name,
                        physics : true,
                        mass : 2,
                        value :100,
                        color: '#E14F3F',
                        shape: 'box',
                        font : {size : 30}


                    })
                } else {
                    nodes.push ({
                        id : data.zones[n].id,
                        label : data.zones[n].name,
                        x : data.zones[n].map_x,
                        y : data.zones[n].map_y,

                        mass : 2,
                        color: '#E14F3F',
                        shape: 'box'
                    })

                }

            }
            for (p in data.portals) {
                console.log(p)
                if (data.portals[p].map_x === null || data.portals[p].map_x === null) {
                    nodes.push ({
                        id : data.portals[p].id + 10000,
                        label : data.portals[p].name,
                        physics : true,
                        font : {size : 20}

                    })
                } else {
                    nodes.push ({
                        id : data.portals[p].id + 10000,
                        label : data.portals[p].name,
                        x : data.portals[p].map_x,
                        y : data.portals[p].map_y

                    })

                }

                edges.push( {

                    from: data.portals[p].zoneFrom,
                    to: data.portals[p].id + 10000,
                    

                })

                edges.push( {

                    from: data.portals[p].id + 10000,
                    to: data.portals[p].zoneTo,
                    

                })
            }
            console.log(nodes)
            console.log(edges)

       



            createNetwork( nodes, edges);
        })

    }


    var createNetwork = function ( nodes, edges) {
        var nodesDataSet = new vis.DataSet(nodes)

        var edgesDataSet = new vis.DataSet(edges);
        var container = document.getElementById('mynetwork');
        var data = {
            nodes: nodesDataSet,
            edges: edgesDataSet
        };

        options = {physics : {stabilization : false}, nodes : {physics : false}}

        var network = new vis.Network(container, data, options);

    network.on('stabilized', function() {
        network.setOptions ({nodes : {fixed: true}})
    })

        console.log(network);
    }
    
    createData(createNetwork)
    // create an array with edges


    // create a network

    var temp = [];
    var removeAll = function() {
        network.storePositions();

        for (x in nodes._data) {
            if (x != 1) {
                node = nodes._data[x]
                temp.push({
                    id: node.id,
                    label: node.label,
                    x: node.x,
                    y: node.y
                })
                nodes.remove({
                    id: x
                });
            }
        }

        for (i = 10; i < 15; i++) {
            nodes.add({
                id: i,
                label: "Emp",
                physics: true
            })
            edges.add({
                from: 1,
                to: i
            })
        }

        console.log(temp)

    }

    var restore = function() {
        for (x in temp) {
            nodes.add(temp[x]);
        }
        temp = []
    }


    $scope.saveConfig = function() {

    }
});
app.controller("PieCtrl", function ($scope) {
	$scope.test = "ahoj";
  $scope.labels = ["Download Sales", "In-Store Sales", "Mail-Order Sales"];
  $scope.data = [300, 500, 100];
});


app.controller('ZonesCtrl', function ($scope, ZonesSvc) {
  $scope.oneAtATime = true;

  $scope.groups = [
    
  ];
  ZonesSvc.fetch().success(function (data) {
    console.log(data);
    for (x in data) {
      $scope.groups.push({title: data[x].name, content: data[x].description})
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
		
		return $http.get('/api/map?buildingID='+buildingId)
	}
})







app.service('ZonesSvc', function($http) {
	this.fetch = function() {
		return $http.get('/api/zones')
	}
})
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

app.service('EmpSvc', function($http) {
	this.fetch = function() {
		
		return $http.get('/api/employees')
	}
})
app.service('ZonesSvc', function($http) {
	this.fetch = function() {
		return $http.get('/api/zones')
	}
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
app.controller('MapCtrl', function ($scope, $location, $timeout) {
    $scope.name = name;
   var nodes = new vis.DataSet([
    {id: 1, label: 'Node 1', x :0, y : 0},
    {id: 2, label: 'Node 2', x : 0, y : 0},
    {id: 3, label: 'Node 3', x : 0, y : 0},
    {id: 4, label: 'Node 4', x : 0, y : 0},
    {id: 5, label: 'Node 5', x : 0, y : 0}
  ]);

  // create an array with edges
  var edges = new vis.DataSet([
    {from: 1, to: 3},
    {from: 1, to: 2},
    {from: 2, to: 4},
    {from: 2, to: 5}
  ]);

  // create a network
  var container = document.getElementById('mynetwork');
  var data = {
    nodes: nodes,
    edges: edges
  };
  var temp = [];
  var removeAll = function() {
    network.storePositions();
    
    for (x in nodes._data){
        if (x != 1) {
        node = nodes._data[x]
        temp.push({id : node.id, label: node.label, x : node.x, y: node.y})
        nodes.remove({id:x});
      }}

      for (i = 10; i < 15; i++) {
        nodes.add({id : i, label: "Emp", physics : true})
        edges.add({from : 1, to : i})
      }
    
    console.log(temp)
    

  }

  var restore = function() {
    for (x in temp) {
      nodes.add(temp[x]);
    }
    temp = []
  }
  var options = {
  physics:{
    stabilization: false
  },nodes:{
  physics: false,
}
}

  var network = new vis.Network(container, data, options);


  $scope.saveConfig = function() {
    if(temp.length == 0) {
      removeAll();
    } else {
      
    }
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
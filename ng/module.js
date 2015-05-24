var app = angular.module('app', ['ngRoute', 'chart.js', 'ngVis']);
app.controller("PieCtrl", function ($scope) {
	$scope.test = "ahoj";
  $scope.labels = ["Download Sales", "In-Store Sales", "Mail-Order Sales"];
  $scope.data = [300, 500, 100];
});

app.controller('appController', function ($scope, $location, $timeout) {
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




 /*
  var nodes = new vis.DataSet([
    {id: 1, label: 'Node 1'},
    {id: 2, label: 'Node 2'},
    {id: 3, label: 'Node 3'},
    {id: 4, label: 'Node 4'},
    {id: 5, label: 'Node 5'}
  ]);

  // create an array with edges
  var edges = new vis.DataSet([
    {from: 1, to: 3},
    {from: 1, to: 2},
    {from: 2, to: 4},
    {from: 2, to: 5}
  ]);
  var lastId= 5;
    $scope.saveConfig = function () {
        
        $scope.data.val += 1;
        nodes.add({id: $scope.data.val, label: 'Node 1', })
        console.log($scope.data.val)

        
    }
    $scope.data = {nodes: nodes, edges: edges, val : 8};
    $scope.options = {
    	height: '100%',
  		width: '100%'

    };
    */
});

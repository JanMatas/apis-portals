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
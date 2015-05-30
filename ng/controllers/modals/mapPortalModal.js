app.controller('MapPortalModalInstance', function ($scope, $modalInstance, $http) {

  	$scope.cancel = function () {
    	$modalInstance.dismiss('cancel');
  	};
});
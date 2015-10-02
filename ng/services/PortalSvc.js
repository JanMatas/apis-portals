app.service('PortalSvc', function($http) {
    this.fetch = function() {
        return $http.get('/api/portal');
    };
    this.fetchTransactions = function(id, from, to) {
    	var url = '/api/transaction/portal/' + id + '?fields=zoneToName,zoneFromName';
    	if (from) {
    		url = url + "&from=" + from;
    	}
    	if (to) {
    		url = url + "&to=" + to
    	}
        return $http.get(url );
    };
});

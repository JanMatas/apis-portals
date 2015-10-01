app.service('ZonesSvc', function($http) {
    this.fetch = function() {
        return $http.get('/api/zone');
    };
    this.fetchTransactions = function(id, from, to) {

    	var url = '/api/transaction/zone/' + id + '?&fields=zoneToName,zoneFromName';
    	if (from) {
    		url = url + "&from=" + from;
    	}
    	if (to) {
    		url = url + "&to=" + to
    	}
        return $http.get(url );
    };
    
});

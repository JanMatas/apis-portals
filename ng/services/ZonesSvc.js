app.service('ZonesSvc', function($http) {
    this.fetch = function() {
        return $http.get('/api/zone');
    };
    this.fetchTransactions = function(id) {
        return $http.get('/api/transaction/zone/' + id);
    };
});
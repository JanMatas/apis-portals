app.filter('timestampToDate', function () {
    return function (timestamp) {
        var date = new Date(timestamp * 1000);
        var dateObject = ('0' + date.getDate()).slice(-2) +'/'+ ('0' + (date.getMonth() + 1)).slice(-2) +'/'+ date.getFullYear();
        return dateObject;
    };
});

app.filter('timestampToTime', function () {
    return function (timestamp) {
        var date = new Date(timestamp * 1000);
        var dateObject = date.getHours()+':'+date.getMinutes()+':'+date.getSeconds();
        return dateObject;
    };
});
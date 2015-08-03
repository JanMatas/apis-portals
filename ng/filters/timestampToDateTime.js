app.filter('timestampToDate', function () {
    return function (timestamp) {
        var time = moment.unix(timestamp);
       
        return time.format("DD.MM");
    };
});

app.filter('timestampToTime', function () {
    return function (timestamp) {
        var time = moment.unix(timestamp);
        

        return time.format("hh:mm:ss");
    };
});
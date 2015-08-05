var ws = require('ws');
var _ = require('lodash');
var portals = [];



var authPortal = function(portalObj, body) {
    //Associate ID
    portalObj.uuid = body;
    console.log("Portal authed with id : " + body )
    // Provide object with control fucntions
    portalObj.arm = function() {
        portalObj.status = "armed";
        portalObj.ws.send("arm");
    };

    portalObj.arm = function() {
        portalObj.status = "disarmed";
        portalObj.ws.send("disarm");
    };
};

var statusChange = function(portalObj, body) {
    portalObj.status = body;
};



var routes = [{
    topic: "authPortal",
    f: authPortal
}, {
    topic: "statusChange",
    f: statusChange
}];




var connect = function(server) {
    var wss = new ws.Server({
        server: server
    });
    wss.on('connection', function(ws) {
        ws.pong = true;
        ws.on('message', function(message) {
            if (message === "pong") {
                ws.pong = true;
            } else {
                routeMessage(ws, message);
            }
        });
        
        portals.push({
            uuid: undefined,
            ws: ws,
            status: "connected"

        });


        //s.send("world");
        ws.hearthbeat = setInterval(function() {
            if (!ws.pong) {
                console.log("No pong received");
                
                ws.close();
            }

            ws.send("ping", function ack(error) {
                if (error) {
                    console.log("ping failed : " + error);
                    ws.close();
                    clearInterval(ws.hearthbeat);
                }

            });
            ws.pong = false;

        }, 3000);
        ws.on('close', function() {
            console.log("disconnect");
            /*
            _.remove(portals, {
                ws: ws
            });
            console.log(portals);
            */
        });

    });
};

module.exports = {
    connect: connect,
    portals: portals
};

var routeMessage = function(ws, message) {
    try {

        var msg = JSON.parse(message);
        var f = _.find(routes, {
            topic: msg.topic
        }).f;

        if (f === undefined) {
            throw "undefined topic";
        }
        portalObj = _.find(portals, {
            ws: ws
        });

        f(portalObj, msg.body);
    } catch (err) {
        console.log("Unable to route:" + message + " " + err);
        return;
    }
};
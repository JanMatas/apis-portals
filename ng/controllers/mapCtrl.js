
//Offset of portal node
var PORTAL_NODE_OFFSET = 10000;

app.controller('MapCtrl', function($scope, MapSvc) {
    $scope.name = name;

    var createData = function(createNetwork) {

        MapSvc.fetch(1).success(function(data) {

            var nodes = [];
            var edges = [];

            for (n in data.zones) {

                if (data.zones[n].map_x === null || data.zones[n].map_x === null) {
                    nodes.push({
                        id: data.zones[n].id,
                        label: data.zones[n].name,
                        physics: true,
                        mass: 2,
                        value: 100,
                        color: '#E14F3F',
                        shape: 'box',
                        font: {
                            size: 30
                        }

                    })
                } else {
                    nodes.push({
                        id: data.zones[n].id,
                        label: data.zones[n].name,
                        x: data.zones[n].map_x,
                        y: data.zones[n].map_y,

                        mass: 2,
                        color: '#E14F3F',
                        shape: 'box'
                    })

                }

            }
            for (p in data.portals) {
                console.log(p)
                if (data.portals[p].map_x === null || data.portals[p].map_x === null) {
                    nodes.push({
                        id: data.portals[p].id + PORTAL_NODE_OFFSET,
                        label: data.portals[p].name,
                        physics: true,
                        font: {
                            size: 20
                        },
                        color: '#FFFFA3',

                    })
                } else {
                    nodes.push({
                        id: data.portals[p].id + PORTAL_NODE_OFFSET,
                        label: data.portals[p].name,
                        x: data.portals[p].map_x,
                        y: data.portals[p].map_y,
                        color: '#FFFFA3'

                    })

                }

                edges.push({

                    from: data.portals[p].zoneFrom,
                    to: data.portals[p].id + PORTAL_NODE_OFFSET,

                })

                edges.push({

                    from: data.portals[p].id + PORTAL_NODE_OFFSET,
                    to: data.portals[p].zoneTo,

                })
            }
            console.log(nodes)
            console.log(edges)

            createNetwork(nodes, edges);
        })

    }

    var createNetwork = function(nodes, edges) {
        var nodesDataSet = new vis.DataSet(nodes)

        var edgesDataSet = new vis.DataSet(edges);
        var container = document.getElementById('mynetwork');
        var data = {
            nodes: nodesDataSet,
            edges: edgesDataSet
        };

        options = {
            physics: {
                stabilization: false
            },
            nodes: {
                physics: false
            }
        }

        var network = new vis.Network(container, data, options);
        $scope.network = network;
        $scope.nodesDataSet = nodesDataSet;
        $scope.edgesDataSet = edgesDataSet;
        network.on('stabilized', function() {
            $scope.saveConfig()
            network.setOptions({
                nodes: {
                    fixed: true
                }
            })
        })

        console.log(network);
    }

    createData(createNetwork)
        // create an array with edges

    // create a network

    var temp = [];

    $scope.saveConfig = function() {
        nodesPositions = $scope.network.getPositions();
        MapSvc.save(nodesPositions);

        
    }
});
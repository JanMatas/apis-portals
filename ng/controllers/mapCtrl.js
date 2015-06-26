//Offset of portal node
var PORTAL_NODE_OFFSET = 10000;

/** This is the controller for the map on home screen*/
app.controller('MapCtrl', function($scope, $modal, MapSvc) {


    var colors = {
        zone: '#E14F3F',
        portal: {
            disarmed: '#83FFFF',
            armed: '#CCFF99',
            disconnected: '#E6E6E6'
        }
    };

    $scope.configuration = true;
    var createData = function(createNetwork) {

        MapSvc.fetch(1).success(function(data) {
            //$scope.mapReady = true;
            var nodes = [];
            var edges = [];

            for (var n in data.zones) {

                if (data.zones[n].map_x === null || data.zones[n].map_x === null) {
                    nodes.push({
                        id: data.zones[n].id,
                        label: data.zones[n].name,
                        physics: true,
                        color: colors.zone,
                        shape: 'box'
                    });
                } else {
                    nodes.push({
                        id: data.zones[n].id,
                        label: data.zones[n].name,
                        x: data.zones[n].map_x,
                        y: data.zones[n].map_y,
                        color: colors.zone,
                        shape: 'box'
                    });

                }
            }
            for (var p in data.portals) {
                var color;
                switch (data.portals[p].status) {
                    case "disconnected":
                        color = colors.portal.disconnected;
                        break;
                    case "armed":
                        color = colors.portal.armed;
                        break;
                    case "disarmed":
                        color = colors.portal.disarmed;
                        break;
                }

                if (data.portals[p].map_x === null || data.portals[p].map_x === null) {
                    nodes.push({
                        id: data.portals[p].id + PORTAL_NODE_OFFSET,
                        label: data.portals[p].name,
                        physics: true,
                        color: color


                    });
                } else {
                    nodes.push({
                        id: data.portals[p].id + PORTAL_NODE_OFFSET,
                        label: data.portals[p].name,
                        x: data.portals[p].map_x,
                        y: data.portals[p].map_y,
                        color: color


                    });

                }
                edges.push({

                    from: data.portals[p].zoneFrom,
                    to: data.portals[p].id + PORTAL_NODE_OFFSET,
                    color: '#E6E6E6'

                });

                edges.push({

                    from: data.portals[p].id + PORTAL_NODE_OFFSET,
                    to: data.portals[p].zoneTo,
                    color: '#E6E6E6'
                });

            }


            createNetwork(nodes, edges);

        });

    };

    var createNetwork = function(nodes, edges) {
        var nodesDataSet = new vis.DataSet(nodes);

        var edgesDataSet = new vis.DataSet(edges);
        var container = document.getElementById('mynetwork');




        var data = {
            nodes: nodesDataSet,
            edges: edgesDataSet
        };

        options = {

            interaction: {
                dragView: false,
                zoomView: false,
                selectConnectedEdges: false
            },

            nodes: {
                physics: false
            },
            edges: {
                smooth: false
            }
        };

        var network = new vis.Network(container, data, options);
        $scope.network = network;
        $scope.nodesDataSet = nodesDataSet;
        $scope.edgesDataSet = edgesDataSet;

        network.on('click', function(properties) {
            var modalInstance;
            if (properties.nodes.length !== 0) {
                if (properties.nodes <= PORTAL_NODE_OFFSET) {
                    modalInstance = $modal.open({

                        templateUrl: 'modals/mapZoneModal.html',
                        controller: 'MapZoneModalInstance',
                        size: 'lg',
                        resolve: {
                            node: function() {

                                return properties.nodes[0];
                            },
                            label: function() {

                                return nodesDataSet.get(properties.nodes)[0].label;
                            }
                        }
                    });

                } else {
                    modalInstance = $modal.open({
                        templateUrl: 'modals/mapPortalModal.html',
                        controller: 'MapPortalModalInstance',
                        size: 'lg',
                        resolve: {
                            label: function() {

                                return nodesDataSet.get(properties.nodes)[0].label;
                            },

                            node: function() {
                                return properties.nodes[0] - PORTAL_NODE_OFFSET;
                            }
                        }
                    });
                }

            }
        });




    };

    createData(createNetwork);

    var temp = [];

    $scope.saveConfig = function() {
        nodesPositions = $scope.network.getPositions();
        MapSvc.save(nodesPositions);

    };

    $scope.rearrange = function() {
        $scope.network.setOptions({
            nodes: {
                physics: true
            },
            edges: {
                smooth: true
            }
        });


        $scope.network.on('stabilized', function() {

            $scope.network.setOptions({
                nodes: {
                    physics: false
                },
                edges: {
                    smooth: false
                }
            });
        });



    };



});
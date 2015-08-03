//Offset of portal node
var PORTAL_NODE_OFFSET = 10000;

/** This is the controller for the map on home screen*/
app.controller('MapCtrl2', function($scope, $modal, MapSvc, AuthSvc, $rootScope, $window) {
    $scope.elements = {}
    $scope.elements.nodes = [];
    $scope.elements.edges = [];
    $scope.editing = false;
    MapSvc.fetch(AuthSvc.getArea()).success(function(data) {

        for (var n in data.zones) {

            var newNode = {
                group: 'nodes',
                data: {
                    id: 'n' + data.zones[n].id,
                    name: data.zones[n].name,
                    typeShape: "ellipse",
                    typeColor: '#335577'
                },
                position: {
                    x: data.zones[n].map_x + 300,
                    y: data.zones[n].map_y + 300
                },
            };
            $scope.elements.nodes.push(newNode);
        }

        for (var p in data.portals) {
            var newNode = {
                group: 'nodes',
                data: {
                    id: 'p' + data.portals[p].id,
                    name: data.portals[p].name,
                    typeShape: "rectangle",
                    typeColor: '#aaaaaa',

                },
                position: {
                    x: data.portals[p].map_x + 300,
                    y: data.portals[p].map_y + 300
                },

            };

            var edge1 = {
                group: "edges",
                data: {
                    source: 'n' + data.portals[p].zoneFrom,
                    target: 'p' + data.portals[p].id
                }
            };
            $scope.elements.edges.push(edge1);
            var edge2 = {
                group: "edges",
                data: {
                    source: 'p' + data.portals[p].id,
                    target: 'n' + data.portals[p].zoneTo
                }
            };


            $scope.elements.nodes.push(newNode);


            $scope.elements.edges.push(edge2);
        }



        $rootScope.$broadcast('appChanged');

        console.log(cy);



    });



    // sample function to be called when clicking on an object in the chart
    $scope.save = function() {

        var nodes = cy.json().elements.nodes;
        var data = [];

        for (var n in nodes) {
            var newData = {
                id: nodes[n].data.id,
                x: nodes[n].position.x,
                y: nodes[n].position.y
            };
            data.push(newData);

        }
        MapSvc.save(data);

        cy.autolock(true);
        $scope.editing = false;


    };
    $scope.edit = function() {
        cy.autolock(false);
        $scope.editing = true;

    };

    $scope.doClick = function(id, label) {

        if (id.charAt() === 'n') {
            modalInstance = $modal.open({

                templateUrl: 'modals/mapZoneModal.html',
                controller: 'MapZoneModalInstance',
                size: 'lg',
                resolve: {
                    node: function() {

                        return id.slice(1);
                    },
                    label: function() {

                        return label;
                    }
                }
            });

        } else {
            modalInstance = $modal.open({
                templateUrl: 'modals/mapPortalModal.html',
                controller: 'MapPortalModalInstance',
                size: 'lg',
                resolve: {
                    node: function() {

                        return id.slice(1);
                    },
                    label: function() {

                        return label;
                    }
                }
            });
        }
    }





});
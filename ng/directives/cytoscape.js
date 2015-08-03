app.directive('cytoscape', function($rootScope) {
    // graph visualisation by - https://github.com/cytoscape/cytoscape.js
    return {
        restrict: 'E',
        template: '<div id="cy"></div>',
        replace: true,
        scope: {
            // data objects to be passed as an attributes - for nodes and edges
            elements: '=',

            // controller function to be triggered when clicking on a node
            cyClick: '&'
        },
        link: function(scope, element, attrs, fn) {

            // graph  build
            scope.doCy = function() { // will be triggered on an event broadcast

                $('#cy').cytoscape({
                    userZoomingEnabled: false,
                    userPanningEnabled: false,
                    layout: {
                        name: 'preset',
                        fit: true, // whether to fit the viewport to the graph
                        ready: undefined, // callback on layoutready
                        stop: undefined, // callback on layoutstop
                        padding: 5 // the padding on fit
                    },
                    style: cytoscape.stylesheet()
                        .selector('node')
                        .css({
                            'shape': 'data(typeShape)',
                            'width': '150',
                            'height': '50',
                            'background-color': 'data(typeColor)',
                            'content': 'data(name)',
                            'text-valign': 'center',
                            'color': 'white',
                            'text-outline-width': 2,
                            'text-outline-color': 'data(typeColor)'
                        })
                        .selector('edge')
                        .css({
                            'width': '4',
                            'target-arrow-shape': 'triangle',
                            'source-arrow-shape': 'triangle'
                        })
                        .selector(':selected')
                        .css({
                            'background-color': 'black',
                            'line-color': 'black',
                            'target-arrow-color': 'black',
                            'source-arrow-color': 'black'
                        })
                        .selector('.faded')
                        .css({
                            'opacity': 0.65,
                            'text-opacity': 0.65
                        }),
                    ready: function() {
                        window.cy = this;
                        cy.autolock(true);

                        cy.elements().unselectify();
                        tappedBefore = null;

                        // Event listeners
                        // with sample calling to the controller function as passed as an attribute
                        cy.on('tap', 'node', function(e) {
                            var evtTarget = e.cyTarget;
                            var nodeId = evtTarget.id();

                            setTimeout(function() {
                                tappedBefore = null;
                            }, 100);
                            if (!tappedBefore) {
                                scope.cyClick({
                                    id: evtTarget.id(),
                                    label: evtTarget.json().data.name
                                });
                            }
                            evtTarget.qtip({
                                content: 'Hello!',
                                position: {
                                    my: 'top center',
                                    at: 'top center'
                                },
                                style: {
                                    classes: 'qtip-bootstrap',
                                    tip: {
                                        width: 16,
                                        height: 8
                                    }
                                }
                            });
                            tappedBefore = true;




                        });

                        // load the objects array
                        // use cy.add() / cy.remove() with passed data to add or remove nodes and edges without rebuilding the graph
                        // sample use can be adding a passed variable which will be broadcast on change

                        cy.load(scope.elements);

                    }
                });

            }; // end doCy()


            $rootScope.$on('appChanged', function() {
                scope.doCy();
            });
        }
    };
});
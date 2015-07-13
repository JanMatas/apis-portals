var express = require('express');
var router = express.Router();

router.use(express.static(__dirname + '/../assets')); // css and js
router.use(express.static(__dirname + '/../portalSimulator')); // Portal Simulator form
router.use(express.static(__dirname + '/../partials')); // Partial views
router.use(express.static(__dirname + '/../data'));	// Data - images 
router.use(express.static(__dirname + '/../layouts'));// Index.html

router.get('/portalSimulator', function(req, res, next) {
	res.sendfile('portalSimulator/portalSimulator.html'); // Serves the portal simulator form
});

router.get('/', function(req, res, next) {
	res.sendfile('index.html'); // Serves the main page of the webApp
});

module.exports = router;
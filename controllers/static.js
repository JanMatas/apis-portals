var express = require('express');
var router = express.Router();

router.use(express.static(__dirname + '/../assets'))
router.use(express.static(__dirname + '/../partials'))
router.use(express.static(__dirname + '/../data'))
router.use(express.static(__dirname + '/'))
router.get('/', function(req, res, next) {
	res.sendfile('layouts/index.html');
});

module.exports = router;
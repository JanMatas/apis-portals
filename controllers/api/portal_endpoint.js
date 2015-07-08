var router = require('express').Router();
var db = require('../../db');
var squel = require('squel');


router.get('/permissions/:id', function(req, res, next) {
    var query = squel.select()
        .distinct()
        .field("sys_static_card.cardnumber")
        .from("sys_reader")
        //Get all users allowed to go to both zones
        .join("por_user_permission", "in", "sys_reader.area_inp_pk_ = in.sys_area_pk_")
        .join("por_user_permission", "out", "sys_reader.area_out_pk_ = out.sys_area_pk_")
        .join("sys_user", null, "sys_user.pk_ = in.sys_user_pk_")
        .join("sys_static_card", null, "sys_static_card.sys_user_pk_ = sys_user.pk_")
        .where("sys_reader.pk_ = " + req.params.id);

    console.log(query.toString());
    // Fetch data from DB
    db.fetchData(query.toString(), function(err, rows) {

        if (err) {
            return next(err);
        }
        return res.json(rows);
    });

});


router.get('/settings/:id', function(req, res, next) {
	var query = squel.select()
		.fields(['data1', 'data2', 'data3', 'data4'])
		.from("por_portal")
		.where('por_portal.sys_reader_pk_ = ' + req.params.id);

    // Fetch data from DB
    db.fetchData(query.toString(), function(err, rows) {

        if (err) {
            return next(err);
        }


        return res.json(rows[0]);
    });
});

router.post('/transaction', function (req, res, next) {
    var t = req.body.transaction;
    
    res.sendStatus(201);

});

module.exports = router;
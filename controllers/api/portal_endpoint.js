var router = require('express').Router();
var db = require('../../db');
var squel = require('squel');


router.get('/permissions/:raspiId', function(req, res, next) {
    var query = squel.select()
        .distinct()
        .field("sys_user.tag")
        .from("sys_reader")
        //Get all users allowed to go to both zones
        .join("por_user_permission", "in", "sys_reader.area_inp_pk_ = in.sys_area_pk_")
        .join("por_user_permission", "out", "sys_reader.area_out_pk_ = out.sys_area_pk_")
        .join("sys_user", null, "sys_user.pk_ = in.sys_user_pk_")

        .where("sys_reader.pk_ = " + req.params.raspiId);

    // Fetch data from DB
    db.fetchData(query.toString(), function(err, rows) {

        if (err) {
            return next(err);
        }
        var data = {};
        data.numberOfTags = rows.length;
        for (var i in rows) {
            
            data["tag" + i] = rows[i].cardnumber;
        
        }
   
        res.json(data);

    });

});


router.get('/settings/:raspiId', function(req, res, next) {
    var query = squel.select()
        .fields(['learning_history', 'thresholding', 'min_area', 'min_dist_to_create', 'max_dist_to_parse', 'shadow_thresh', 'frame_width', 'frame_height' ])
        .from("sys_reader")
        .where('sys_reader.sys_reader_pk_ = ' + req.params.raspiId);

    // Fetch data from DB
    db.fetchData(query.toString(), function(err, rows) {

        if (err) {
            return next(err);
        }


        return res.json(rows[0]);
    });
});

router.get('/transaction/:raspiId', function(req,res, next) {
    return res.status(200).send("aa");
});

router.post('/transaction/:raspiId', function(req, res, next) {
    console.log("transaction -> id: " + req.body.tagId + " dir: " +  
         req.body.direction + " portal: " + req.params.raspiId);
    if (!req.body) {
        return res.status(403).send("No request body");
    }


    // get user pk_
    var query = squel.select()
        .field("pk_", "id")
        .from("sys_user")
        .where("sys_user.tag = " + req.body.tagId);
        // TODO missing data .where("sys_static_card.cardnumber = " + req.body.tagId);


    db.fetchData(query.toString(), function(err, rows) {

        if (err) {
            return next(err);
        }
        
        if (rows.length === 0 && req.body.alarm !== "alarm" ) {
            return res.status(404).send("User with given id does not exist");
        } 
        if (req.body.alarm !== "alarm") {
            var userId = rows[0].id;
        }
        console.log(rows)
        
        query = squel.select()
            .field("sys_reader.pk_")
            .from("sys_reader")

            .where("sys_reader.raspiId = " + req.params.raspiId);

        db.fetchData(query.toString(), function(err, rows) {

            if (err) {
                return next(err);
            }

            if (rows.length === 0) {
                return res.status(404).send("Portal with given raspiId does not exist");

            }
            var readerId = rows[0].pk_;
            var date = req.body.timestamp;
            if (!date) {
                date = new Date().toISOString().slice(0, 19).replace('T', ' ');
            } 
            /*
             * TODO - fix employment and company
             */

            query = squel.insert()
  
                .into("sys_elog")
                .set("t_reader", readerId)
                .set("t_date", date)
                .set("ss6", req.body.direction)
            if (userId) {
                query.set("sys_user_pk_", userId);
            }
            if(req.body.alarm) {
                query.set("ss5","alarm")
            }
            

            console.log(query.toString())
            db.executeQuery(query.toString(), function(err, data) {

                if (err) {
                    return next(err);
                }


                res.sendStatus(201);
            });
        });
    });



});

module.exports = router;
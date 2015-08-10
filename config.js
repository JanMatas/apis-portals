module.exports = {
	secret: 'supersecretkey',
	port: 3000,
	db: {
		connectionLimit : 10,
		host :'us-cdbr-iron-east-02.cleardb.net',
		user :'b369ac359b0a33',
		password: '1839ba5b',
		database: 'heroku_73648698f572409',
		debug:false
	},
	/*
	
	db: {
		connectionLimit : 10,
		host :'localhost',
		user :'root',
		password: '092468',
		database: 'brany',
		debug:false
	},
	*/
	authenticate:false
	
};

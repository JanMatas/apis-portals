var gulp = require('gulp');
var concat = require('gulp-concat');
//var ngAnnotate = require('gulp-ng-annotate');
//var uglify = require('gulp-uglify');
var fs = require('fs');

fs.readdirSync(__dirname+'/gulp').forEach(function (task) {
	require('./gulp/'+task);
});

gulp.task('watch:js', ['js'], function() {
	gulp.watch('ng/**/*.js', ['js']);
});

gulp.task('js', function() {
	gulp.src(['ng/module.js', 'ng/**/*js'])
		.pipe(concat('app.js'))
		//.pipe(ngAnnotate())
		//.pipe(uglify())
		.pipe(gulp.dest('assets'));
});

gulp.task('dev', ['watch:js', 'dev:server']);
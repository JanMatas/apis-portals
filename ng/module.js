//Frontend entry point
var app = angular.module('app', ['ngRoute','angularSpinner','datetimepicker', 'chart.js', 'ui.bootstrap', 'ngCookies','toggle-switch', 'angularBootstrapNavTree', 'ngLodash', 'ngFileUpload'])
					.config([
						'datetimepickerProvider',
						function (datetimepickerProvider) {
							datetimepickerProvider.setOptions({
								locale: 'en'
							});
						}
					]);

/*! app/collections/assessresults
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Assessresults
*/
define("app/collections/assessresults",function(require,app) {
	var AssessresultModel = require("app/models/assessresult");

	app.collections.Assessresults = app.Collection.extend({
		url: '/assessresults/',
		model: AssessresultModel
	});

	exports.app = app;
});

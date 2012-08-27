/*! app/collections/assessresults
* 	@requires: app,app/models/assessresult
* 	@extends: app.Collection
* 	@exports: app.collections.Assessresults
*/
define("app/collections/assessresults",["require","app","app/models"],function(require,app) {
	var AssessresultModel = require("app/models/assessresult");

	var Assessresults = app.Collection.extend({
		url: '/assessresults/',
		model: AssessresultModel
	});

	module.setExports(Assessresults);
});

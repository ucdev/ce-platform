/*! app/collections/assessresults
* 	@requires: app,app/collection,app/models/assessresult
* 	@extends: app.Collection
* 	@exports: app.collections.Assessresults
*/
define("app/collections/assessresults",["require"],function(require) {
	var AppCollection = require("app/collection");
	var AssessresultModel = require("app/models/assessresult");
	
	Assessresults = AppCollection.extend({
		url: '/assessresults/',
		model: AssessresultModel
	});

	module.setExports(Assessresults);
});

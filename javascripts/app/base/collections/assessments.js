/*! app/collections/assessments
* 	@requires: app,app/collection,app/models/assessment
* 	@extends: app.Collection
* 	@exports: app.collections.Assessments
*/
define("app/collections/assessments",["require"],function(require) {
	var AppCollection = require("app/collection");
	var AssessmentModel = require("app/models/assessment");
	
	Assessments = AppCollection.extend({
		url: '/assessments/',
		model: AssessmentModel
	});

	module.setExports(Assessments);
});

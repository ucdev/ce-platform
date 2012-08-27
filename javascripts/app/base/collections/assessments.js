/*! app/collections/assessments
* 	@requires: app,app/models/assessment
* 	@extends: app.Collection
* 	@exports: app.collections.Assessments
*/
define("app/collections/assessments",["require","app","app/models"],function(require,app) {
	var AssessmentModel = require("app/models/assessment");

	var Assessments = app.Collection.extend({
		url: '/assessments/',
		model: AssessmentModel
	});

	module.setExports(Assessments);
});

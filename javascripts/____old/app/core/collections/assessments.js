/*! app/collections/assessments
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Assessments
*/
define("app/collections/assessments",function(require,app) {
	var AssessmentModel = require("app/models/assessment");

	app.collections.Assessments = app.Collection.extend({
		url: '/assessments/',
		model: AssessmentModel
	});

	exports.app = app;
});

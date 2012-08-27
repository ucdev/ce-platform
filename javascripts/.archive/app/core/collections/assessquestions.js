/*! app/collections/assessquestions
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Assessquestions
*/
define("app/collections/assessquestions",function(require,app) {
	var AssessquestionModel = require("app/models/assessquestion");

	app.collections.Assessquestions = app.Collection.extend({
		url: '/assessquestions/',
		model: AssessquestionModel
	});

	exports.app = app;
});

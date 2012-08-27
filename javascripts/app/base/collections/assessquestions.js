/*! app/collections/assessquestions
* 	@requires: app,app/models/assessquestion
* 	@extends: app.Collection
* 	@exports: app.collections.Assessquestions
*/
define("app/collections/assessquestions",["require","app","app/models"],function(require,app) {
	var AssessquestionModel = require("app/models/assessquestion");

	var Assessquestions = app.Collection.extend({
		url: '/assessquestions/',
		model: AssessquestionModel
	});

	module.setExports(Assessquestions);
});

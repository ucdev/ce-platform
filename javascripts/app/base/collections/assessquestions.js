/*! app/collections/assessquestions
* 	@requires: app,app/collection,app/models/assessquestion
* 	@extends: app.Collection
* 	@exports: app.collections.Assessquestions
*/
define("app/collections/assessquestions",["require"],function(require) {
	var AppCollection = require("app/collection");
	var AssessquestionModel = require("app/models/assessquestion");
	
	Assessquestions = AppCollection.extend({
		url: '/assessquestions/',
		model: AssessquestionModel
	});

	module.setExports(Assessquestions);
});

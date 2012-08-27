/*! app/collections/assessanswers
* 	@requires: app,app/collection,app/models/assessanswer
* 	@extends: app.Collection
* 	@exports: app.collections.Assessanswers
*/
define("app/collections/assessanswers",["require"],function(require) {
	var AppCollection = require("app/collection");
	var AssessanswerModel = require("app/models/assessanswer");
	
	Assessanswers = AppCollection.extend({
		url: '/assessanswers/',
		model: AssessanswerModel
	});

	module.setExports(Assessanswers);
});

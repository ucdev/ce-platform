/*! app/collections/assessanswers
* 	@requires: app,app/models/assessanswer
* 	@extends: app.Collection
* 	@exports: app.collections.Assessanswers
*/
define("app/collections/assessanswers",["require","app","app/models"],function(require,app) {
	var AssessanswerModel = require("app/models/assessanswer");

	var Assessanswers = app.Collection.extend({
		url: '/assessanswers/',
		model: AssessanswerModel
	});

	module.setExports(Assessanswers);
});

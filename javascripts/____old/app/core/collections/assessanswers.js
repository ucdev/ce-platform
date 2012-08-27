/*! app/collections/assessanswers
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Assessanswers
*/
define("app/collections/assessanswers",function(require,app) {
	var AssessanswerModel = require("app/models/assessanswer");

	app.collections.Assessanswers = app.Collection.extend({
		url: '/assessanswers/',
		model: AssessanswerModel
	});

	exports.app = app;
});

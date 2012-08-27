/*! app/collections/assesssections
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Assesssections
*/
define("app/collections/assesssections",function(require,app) {
	var AssesssectionModel = require("app/models/assesssection");

	app.collections.Assesssections = app.Collection.extend({
		url: '/assesssections/',
		model: AssesssectionModel
	});

	exports.app = app;
});

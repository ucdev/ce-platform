/*! app/collections/assesssections
* 	@requires: app,app/models/assesssection
* 	@extends: app.Collection
* 	@exports: app.collections.Assesssections
*/
define("app/collections/assesssections",["require","app","app/models"],function(require,app) {
	var AssesssectionModel = require("app/models/assesssection");

	var Assesssections = app.Collection.extend({
		url: '/assesssections/',
		model: AssesssectionModel
	});

	module.setExports(Assesssections);
});

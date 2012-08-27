/*! app/collections/assesssections
* 	@requires: app,app/collection,app/models/assesssection
* 	@extends: app.Collection
* 	@exports: app.collections.Assesssections
*/
define("app/collections/assesssections",["require"],function(require) {
	var AppCollection = require("app/collection");
	var AssesssectionModel = require("app/models/assesssection");
	
	Assesssections = AppCollection.extend({
		url: '/assesssections/',
		model: AssesssectionModel
	});

	module.setExports(Assesssections);
});

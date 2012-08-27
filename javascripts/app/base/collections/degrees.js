/*! app/collections/degrees
* 	@requires: app,app/collection,app/models/degree
* 	@extends: app.Collection
* 	@exports: app.collections.Degrees
*/
define("app/collections/degrees",["require"],function(require) {
	var AppCollection = require("app/collection");
	var DegreeModel = require("app/models/degree");
	
	Degrees = AppCollection.extend({
		url: '/degrees/',
		model: DegreeModel
	});

	module.setExports(Degrees);
});

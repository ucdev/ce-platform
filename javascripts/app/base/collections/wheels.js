/*! app/collections/wheels
* 	@requires: app,app/collection,app/models/wheel
* 	@extends: app.Collection
* 	@exports: app.collections.Wheels
*/
define("app/collections/wheels",["require"],function(require) {
	var AppCollection = require("app/collection");
	var WheelModel = require("app/models/wheel");
	
	Wheels = AppCollection.extend({
		url: '/wheels/',
		model: WheelModel
	});

	module.setExports(Wheels);
});

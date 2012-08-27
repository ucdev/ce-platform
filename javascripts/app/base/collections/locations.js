/*! app/collections/locations
* 	@requires: app,app/collection,app/models/location
* 	@extends: app.Collection
* 	@exports: app.collections.Locations
*/
define("app/collections/locations",["require"],function(require) {
	var AppCollection = require("app/collection");
	var LocationModel = require("app/models/location");
	
	Locations = AppCollection.extend({
		url: '/locations/',
		model: LocationModel
	});

	module.setExports(Locations);
});

/*! app/collections/locations
* 	@requires: app,app/models/location
* 	@extends: app.Collection
* 	@exports: app.collections.Locations
*/
define("app/collections/locations",["require","app","app/models"],function(require,app) {
	var LocationModel = require("app/models/location");

	var Locations = app.Collection.extend({
		url: '/locations/',
		model: LocationModel
	});

	module.setExports(Locations);
});

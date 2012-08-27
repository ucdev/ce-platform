/*! app/collections/locations
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Locations
*/
define("app/collections/locations",function(require,app) {
	var LocationModel = require("app/models/location");

	app.collections.Locations = app.Collection.extend({
		url: '/locations/',
		model: LocationModel
	});

	exports.app = app;
});

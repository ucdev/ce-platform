/*! app/collections/locationtypes
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Locationtypes
*/
define("app/collections/locationtypes",function(require,app) {
	var LocationtypeModel = require("app/models/locationtype");

	app.collections.Locationtypes = app.Collection.extend({
		url: '/locationtypes/',
		model: LocationtypeModel
	});

	exports.app = app;
});

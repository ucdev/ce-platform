/*! app/collections/locationtypes
* 	@requires: app,app/collection,app/models/locationtype
* 	@extends: app.Collection
* 	@exports: app.collections.Locationtypes
*/
define("app/collections/locationtypes",["require"],function(require) {
	var AppCollection = require("app/collection");
	var LocationtypeModel = require("app/models/locationtype");
	
	Locationtypes = AppCollection.extend({
		url: '/locationtypes/',
		model: LocationtypeModel
	});

	module.setExports(Locationtypes);
});

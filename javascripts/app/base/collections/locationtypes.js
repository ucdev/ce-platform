/*! app/collections/locationtypes
* 	@requires: app,app/models/locationtype
* 	@extends: app.Collection
* 	@exports: app.collections.Locationtypes
*/
define("app/collections/locationtypes",["require","app","app/models"],function(require,app) {
	var LocationtypeModel = require("app/models/locationtype");

	var Locationtypes = app.Collection.extend({
		url: '/locationtypes/',
		model: LocationtypeModel
	});

	module.setExports(Locationtypes);
});

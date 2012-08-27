/*! app/collections/geonames
* 	@requires: app,app/collection,app/models/geoname
* 	@extends: app.Collection
* 	@exports: app.collections.Geonames
*/
define("app/collections/geonames",["require"],function(require) {
	var AppCollection = require("app/collection");
	var GeonameModel = require("app/models/geoname");
	
	Geonames = AppCollection.extend({
		url: '/geonames/',
		model: GeonameModel
	});

	module.setExports(Geonames);
});

/*! app/collections/relicensures
* 	@requires: app,app/collection,app/models/relicensure
* 	@extends: app.Collection
* 	@exports: app.collections.Relicensures
*/
define("app/collections/relicensures",["require"],function(require) {
	var AppCollection = require("app/collection");
	var RelicensureModel = require("app/models/relicensure");
	
	Relicensures = AppCollection.extend({
		url: '/relicensures/',
		model: RelicensureModel
	});

	module.setExports(Relicensures);
});

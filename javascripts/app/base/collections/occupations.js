/*! app/collections/occupations
* 	@requires: app,app/collection,app/models/occupation
* 	@extends: app.Collection
* 	@exports: app.collections.Occupations
*/
define("app/collections/occupations",["require"],function(require) {
	var AppCollection = require("app/collection");
	var OccupationModel = require("app/models/occupation");
	
	Occupations = AppCollection.extend({
		url: '/occupations/',
		model: OccupationModel
	});

	module.setExports(Occupations);
});

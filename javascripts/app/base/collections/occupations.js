/*! app/collections/occupations
* 	@requires: app,app/models/occupation
* 	@extends: app.Collection
* 	@exports: app.collections.Occupations
*/
define("app/collections/occupations",["require","app","app/models"],function(require,app) {
	var OccupationModel = require("app/models/occupation");

	var Occupations = app.Collection.extend({
		url: '/occupations/',
		model: OccupationModel
	});

	module.setExports(Occupations);
});

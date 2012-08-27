/*! app/collections/occupations
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Occupations
*/
define("app/collections/occupations",function(require,app) {
	var OccupationModel = require("app/models/occupation");

	app.collections.Occupations = app.Collection.extend({
		url: '/occupations/',
		model: OccupationModel
	});

	exports.app = app;
});

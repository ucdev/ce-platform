/*! app/collections/degrees
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Degrees
*/
define("app/collections/degrees",function(require,app) {
	var DegreeModel = require("app/models/degree");

	app.collections.Degrees = app.Collection.extend({
		url: '/degrees/',
		model: DegreeModel
	});

	exports.app = app;
});

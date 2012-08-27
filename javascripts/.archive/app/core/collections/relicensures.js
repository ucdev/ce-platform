/*! app/collections/relicensures
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Relicensures
*/
define("app/collections/relicensures",function(require,app) {
	var RelicensureModel = require("app/models/relicensure");

	app.collections.Relicensures = app.Collection.extend({
		url: '/relicensures/',
		model: RelicensureModel
	});

	exports.app = app;
});

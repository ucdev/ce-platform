/*! app/collections/objectfields
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Objectfields
*/
define("app/collections/objectfields",function(require,app) {
	var ObjectfieldModel = require("app/models/objectfield");

	app.collections.Objectfields = app.Collection.extend({
		url: '/objectfields/',
		model: ObjectfieldModel
	});

	exports.app = app;
});

/*! app/collections/objecttypes
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Objecttypes
*/
define("app/collections/objecttypes",function(require,app) {
	var ObjecttypeModel = require("app/models/objecttype");

	app.collections.Objecttypes = app.Collection.extend({
		url: '/objecttypes/',
		model: ObjecttypeModel
	});

	exports.app = app;
});

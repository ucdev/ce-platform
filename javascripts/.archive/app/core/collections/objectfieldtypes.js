/*! app/collections/objectfieldtypes
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Objectfieldtypes
*/
define("app/collections/objectfieldtypes",function(require,app) {
	var ObjectfieldtypeModel = require("app/models/objectfieldtype");

	app.collections.Objectfieldtypes = app.Collection.extend({
		url: '/objectfieldtypes/',
		model: ObjectfieldtypeModel
	});

	exports.app = app;
});

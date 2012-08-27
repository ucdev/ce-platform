/*! app/collections/objects
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Objects
*/
define("app/collections/objects",function(require,app) {
	var ObjectModel = require("app/models/object");

	app.collections.Objects = app.Collection.extend({
		url: '/objects/',
		model: ObjectModel
	});

	exports.app = app;
});

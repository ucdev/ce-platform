/*! app/collections/objectforms
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Objectforms
*/
define("app/collections/objectforms",function(require,app) {
	var ObjectformModel = require("app/models/objectform");

	app.collections.Objectforms = app.Collection.extend({
		url: '/objectforms/',
		model: ObjectformModel
	});

	exports.app = app;
});

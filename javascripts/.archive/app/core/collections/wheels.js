/*! app/collections/wheels
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Wheels
*/
define("app/collections/wheels",function(require,app) {
	var WheelModel = require("app/models/wheel");

	app.collections.Wheels = app.Collection.extend({
		url: '/wheels/',
		model: WheelModel
	});

	exports.app = app;
});

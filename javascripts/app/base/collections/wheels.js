/*! app/collections/wheels
* 	@requires: app,app/models/wheel
* 	@extends: app.Collection
* 	@exports: app.collections.Wheels
*/
define("app/collections/wheels",["require","app","app/models"],function(require,app) {
	var WheelModel = require("app/models/wheel");

	var Wheels = app.Collection.extend({
		url: '/wheels/',
		model: WheelModel
	});

	module.setExports(Wheels);
});

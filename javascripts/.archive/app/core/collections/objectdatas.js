/*! app/collections/objectdatas
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Objectdatas
*/
define("app/collections/objectdatas",function(require,app) {
	var ObjectdatumModel = require("app/models/objectdatum");

	app.collections.Objectdatas = app.Collection.extend({
		url: '/objectdatas/',
		model: ObjectdatumModel
	});

	exports.app = app;
});

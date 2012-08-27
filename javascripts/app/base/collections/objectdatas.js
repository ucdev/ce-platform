/*! app/collections/objectdatas
* 	@requires: app,app/models/objectdatum
* 	@extends: app.Collection
* 	@exports: app.collections.Objectdatas
*/
define("app/collections/objectdatas",["require","app","app/models"],function(require,app) {
	var ObjectdatumModel = require("app/models/objectdatum");

	var Objectdatas = app.Collection.extend({
		url: '/objectdatas/',
		model: ObjectdatumModel
	});

	module.setExports(Objectdatas);
});

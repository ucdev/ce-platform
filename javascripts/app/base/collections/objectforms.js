/*! app/collections/objectforms
* 	@requires: app,app/models/objectform
* 	@extends: app.Collection
* 	@exports: app.collections.Objectforms
*/
define("app/collections/objectforms",["require","app","app/models"],function(require,app) {
	var ObjectformModel = require("app/models/objectform");

	var Objectforms = app.Collection.extend({
		url: '/objectforms/',
		model: ObjectformModel
	});

	module.setExports(Objectforms);
});

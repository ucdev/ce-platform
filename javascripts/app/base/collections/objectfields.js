/*! app/collections/objectfields
* 	@requires: app,app/models/objectfield
* 	@extends: app.Collection
* 	@exports: app.collections.Objectfields
*/
define("app/collections/objectfields",["require","app","app/models"],function(require,app) {
	var ObjectfieldModel = require("app/models/objectfield");

	var Objectfields = app.Collection.extend({
		url: '/objectfields/',
		model: ObjectfieldModel
	});

	module.setExports(Objectfields);
});

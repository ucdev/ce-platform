/*! app/collections/objectfieldtypes
* 	@requires: app,app/models/objectfieldtype
* 	@extends: app.Collection
* 	@exports: app.collections.Objectfieldtypes
*/
define("app/collections/objectfieldtypes",["require","app","app/models"],function(require,app) {
	var ObjectfieldtypeModel = require("app/models/objectfieldtype");

	var Objectfieldtypes = app.Collection.extend({
		url: '/objectfieldtypes/',
		model: ObjectfieldtypeModel
	});

	module.setExports(Objectfieldtypes);
});

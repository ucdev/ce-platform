/*! app/collections/objecttypes
* 	@requires: app,app/models/objecttype
* 	@extends: app.Collection
* 	@exports: app.collections.Objecttypes
*/
define("app/collections/objecttypes",["require","app","app/models"],function(require,app) {
	var ObjecttypeModel = require("app/models/objecttype");

	var Objecttypes = app.Collection.extend({
		url: '/objecttypes/',
		model: ObjecttypeModel
	});

	module.setExports(Objecttypes);
});

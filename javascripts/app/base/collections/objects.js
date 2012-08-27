/*! app/collections/objects
* 	@requires: app,app/models/object
* 	@extends: app.Collection
* 	@exports: app.collections.Objects
*/
define("app/collections/objects",["require","app","app/models"],function(require,app) {
	var ObjectModel = require("app/models/object");

	var Objects = app.Collection.extend({
		url: '/objects/',
		model: ObjectModel
	});

	module.setExports(Objects);
});

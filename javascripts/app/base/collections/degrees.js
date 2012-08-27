/*! app/collections/degrees
* 	@requires: app,app/models/degree
* 	@extends: app.Collection
* 	@exports: app.collections.Degrees
*/
define("app/collections/degrees",["require","app","app/models"],function(require,app) {
	var DegreeModel = require("app/models/degree");

	var Degrees = app.Collection.extend({
		url: '/degrees/',
		model: DegreeModel
	});

	module.setExports(Degrees);
});

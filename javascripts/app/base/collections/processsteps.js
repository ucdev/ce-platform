/*! app/collections/processsteps
* 	@requires: app,app/models/processstep
* 	@extends: app.Collection
* 	@exports: app.collections.Processsteps
*/
define("app/collections/processsteps",["require","app","app/models"],function(require,app) {
	var ProcessstepModel = require("app/models/processstep");

	var Processsteps = app.Collection.extend({
		url: '/processsteps/',
		model: ProcessstepModel
	});

	module.setExports(Processsteps);
});

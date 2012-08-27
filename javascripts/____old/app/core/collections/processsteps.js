/*! app/collections/processsteps
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Processsteps
*/
define("app/collections/processsteps",function(require,app) {
	var ProcessstepModel = require("app/models/processstep");

	app.collections.Processsteps = app.Collection.extend({
		url: '/processsteps/',
		model: ProcessstepModel
	});

	exports.app = app;
});

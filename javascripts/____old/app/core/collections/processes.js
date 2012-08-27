/*! app/collections/processes
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Processes
*/
define("app/collections/processes",function(require,app) {
	var ProcessModel = require("app/models/process");

	app.collections.Processes = app.Collection.extend({
		url: '/processes/',
		model: ProcessModel
	});

	exports.app = app;
});

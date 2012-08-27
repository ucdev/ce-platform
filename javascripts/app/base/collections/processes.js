/*! app/collections/processes
* 	@requires: app,app/models/process
* 	@extends: app.Collection
* 	@exports: app.collections.Processes
*/
define("app/collections/processes",["require","app","app/models"],function(require,app) {
	var ProcessModel = require("app/models/process");

	var Processes = app.Collection.extend({
		url: '/processes/',
		model: ProcessModel
	});

	module.setExports(Processes);
});

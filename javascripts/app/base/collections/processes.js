/*! app/collections/processes
* 	@requires: app,app/collection,app/models/process
* 	@extends: app.Collection
* 	@exports: app.collections.Processes
*/
define("app/collections/processes",["require"],function(require) {
	var AppCollection = require("app/collection");
	var ProcessModel = require("app/models/process");
	
	Processes = AppCollection.extend({
		url: '/processes/',
		model: ProcessModel
	});

	module.setExports(Processes);
});

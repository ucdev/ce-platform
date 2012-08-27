/*! app/collections/process_persons
* 	@requires: app,app/models/process_person
* 	@extends: app.Collection
* 	@exports: app.collections.Process_persons
*/
define("app/collections/process_persons",["require","app","app/models"],function(require,app) {
	var Process_personModel = require("app/models/process_person");

	var Process_persons = app.Collection.extend({
		url: '/process_persons/',
		model: Process_personModel
	});

	module.setExports(Process_persons);
});

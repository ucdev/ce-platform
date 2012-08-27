/*! app/collections/process_persons
* 	@requires: app,app/collection,app/models/process_person
* 	@extends: app.Collection
* 	@exports: app.collections.Process_persons
*/
define("app/collections/process_persons",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Process_personModel = require("app/models/process_person");
	
	Process_persons = AppCollection.extend({
		url: '/process_persons/',
		model: Process_personModel
	});

	module.setExports(Process_persons);
});

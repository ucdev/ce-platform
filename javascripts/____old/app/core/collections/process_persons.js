/*! app/collections/process_persons
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Process_persons
*/
define("app/collections/process_persons",function(require,app) {
	var Process_personModel = require("app/models/process_person");

	app.collections.Process_persons = app.Collection.extend({
		url: '/process_persons/',
		model: Process_personModel
	});

	exports.app = app;
});

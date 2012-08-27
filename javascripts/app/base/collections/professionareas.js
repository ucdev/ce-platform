/*! app/collections/professionareas
* 	@requires: app,app/collection,app/models/professionarea
* 	@extends: app.Collection
* 	@exports: app.collections.Professionareas
*/
define("app/collections/professionareas",["require"],function(require) {
	var AppCollection = require("app/collection");
	var ProfessionareaModel = require("app/models/professionarea");
	
	Professionareas = AppCollection.extend({
		url: '/professionareas/',
		model: ProfessionareaModel
	});

	module.setExports(Professionareas);
});

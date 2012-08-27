/*! app/collections/professionareas
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Professionareas
*/
define("app/collections/professionareas",function(require,app) {
	var ProfessionareaModel = require("app/models/professionarea");

	app.collections.Professionareas = app.Collection.extend({
		url: '/professionareas/',
		model: ProfessionareaModel
	});

	exports.app = app;
});

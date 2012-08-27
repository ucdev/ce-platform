/*! app/collections/professionareas
* 	@requires: app,app/models/professionarea
* 	@extends: app.Collection
* 	@exports: app.collections.Professionareas
*/
define("app/collections/professionareas",["require","app","app/models"],function(require,app) {
	var ProfessionareaModel = require("app/models/professionarea");

	var Professionareas = app.Collection.extend({
		url: '/professionareas/',
		model: ProfessionareaModel
	});

	module.setExports(Professionareas);
});

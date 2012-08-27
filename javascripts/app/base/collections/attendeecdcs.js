/*! app/collections/attendeecdcs
* 	@requires: app,app/collection,app/models/attendeecdc
* 	@extends: app.Collection
* 	@exports: app.collections.Attendeecdcs
*/
define("app/collections/attendeecdcs",["require"],function(require) {
	var AppCollection = require("app/collection");
	var AttendeecdcModel = require("app/models/attendeecdc");
	
	Attendeecdcs = AppCollection.extend({
		url: '/attendeecdcs/',
		model: AttendeecdcModel
	});

	module.setExports(Attendeecdcs);
});

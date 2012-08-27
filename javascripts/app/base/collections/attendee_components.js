/*! app/collections/attendee_components
* 	@requires: app,app/collection,app/models/attendee_component
* 	@extends: app.Collection
* 	@exports: app.collections.Attendee_components
*/
define("app/collections/attendee_components",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Attendee_componentModel = require("app/models/attendee_component");
	
	Attendee_components = AppCollection.extend({
		url: '/attendee_components/',
		model: Attendee_componentModel
	});

	module.setExports(Attendee_components);
});

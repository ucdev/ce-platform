/*! app/collections/attendee_components
* 	@requires: app,app/models/attendee_component
* 	@extends: app.Collection
* 	@exports: app.collections.Attendee_components
*/
define("app/collections/attendee_components",["require","app","app/models"],function(require,app) {
	var Attendee_componentModel = require("app/models/attendee_component");

	var Attendee_components = app.Collection.extend({
		url: '/attendee_components/',
		model: Attendee_componentModel
	});

	module.setExports(Attendee_components);
});

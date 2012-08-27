/*! app/collections/attendee_components
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Attendee_components
*/
define("app/collections/attendee_components",function(require,app) {
	var Attendee_componentModel = require("app/models/attendee_component");

	app.collections.Attendee_components = app.Collection.extend({
		url: '/attendee_components/',
		model: Attendee_componentModel
	});

	exports.app = app;
});

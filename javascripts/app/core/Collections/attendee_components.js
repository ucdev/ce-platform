/*! app/core/collections/Attendee_components */
define("app/core/collections/Attendee_components",function() {
	var Attendee_components = Backbone.Collection.extend({
			url: '/attendee_components/',
			model: models.Attendee_component
		});

	exports.Attendee_components = Attendee_components;
});

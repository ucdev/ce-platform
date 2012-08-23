/*! app/core/collections/Attendee_steps */
define("app/core/collections/Attendee_steps",function() {
	var Attendee_steps = Backbone.Collection.extend({
			url: '/attendee_steps/',
			model: models.Attendee_step
		});

	exports.Attendee_steps = Attendee_steps;
});

/*! app/core/collections/Attendees */
define("app/core/collections/Attendees",function() {
	var Attendees = Backbone.Collection.extend({
			url: '/attendees/',
			model: models.Attendee
		});

	exports.Attendees = Attendees;
});

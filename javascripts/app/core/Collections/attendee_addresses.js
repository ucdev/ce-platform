/*! app/core/collections/Attendee_addresses */
define("app/core/collections/Attendee_addresses",function() {
	var Attendee_addresses = Backbone.Collection.extend({
			url: '/attendee_addresses/',
			model: models.Attendee_address
		});

	exports.Attendee_addresses = Attendee_addresses;
});

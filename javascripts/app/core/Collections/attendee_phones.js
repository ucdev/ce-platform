/*! app/core/collections/Attendee_phones */
define("app/core/collections/Attendee_phones",function() {
	var Attendee_phones = Backbone.Collection.extend({
			url: '/attendee_phones/',
			model: models.Attendee_phone
		});

	exports.Attendee_phones = Attendee_phones;
});

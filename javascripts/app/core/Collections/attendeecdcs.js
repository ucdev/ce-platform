/*! app/core/collections/Attendeecdcs */
define("app/core/collections/Attendeecdcs",function() {
	var Attendeecdcs = Backbone.Collection.extend({
			url: '/attendeecdcs/',
			model: models.Attendeecdc
		});

	exports.Attendeecdcs = Attendeecdcs;
});

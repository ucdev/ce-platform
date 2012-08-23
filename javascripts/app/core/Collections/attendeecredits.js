/*! app/core/collections/Attendeecredits */
define("app/core/collections/Attendeecredits",function() {
	var Attendeecredits = Backbone.Collection.extend({
			url: '/attendeecredits/',
			model: models.Attendeecredit
		});

	exports.Attendeecredits = Attendeecredits;
});

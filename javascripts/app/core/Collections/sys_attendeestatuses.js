/*! app/core/collections/Sys_attendeestatuses */
define("app/core/collections/Sys_attendeestatuses",function() {
	var Sys_attendeestatuses = Backbone.Collection.extend({
			url: '/sys_attendeestatuses/',
			model: models.Sys_attendeestatu
		});

	exports.Sys_attendeestatuses = Sys_attendeestatuses;
});

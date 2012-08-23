/*! app/core/collections/Activities */
define("app/core/collections/Activities",function() {
	var Activities = Backbone.Collection.extend({
			url: '/activities/',
			model: models.Activity
		});

	exports.Activities = Activities;
});

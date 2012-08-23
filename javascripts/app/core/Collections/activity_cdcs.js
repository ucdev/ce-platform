/*! app/core/collections/Activity_cdcs */
define("app/core/collections/Activity_cdcs",function() {
	var Activity_cdcs = Backbone.Collection.extend({
			url: '/activity_cdcs/',
			model: models.Activity_cdc
		});

	exports.Activity_cdcs = Activity_cdcs;
});

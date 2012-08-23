/*! app/core/collections/Activity_finbudgets */
define("app/core/collections/Activity_finbudgets",function() {
	var Activity_finbudgets = Backbone.Collection.extend({
			url: '/activity_finbudgets/',
			model: models.Activity_finbudget
		});

	exports.Activity_finbudgets = Activity_finbudgets;
});

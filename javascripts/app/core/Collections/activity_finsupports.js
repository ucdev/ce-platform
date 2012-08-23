/*! app/core/collections/Activity_finsupports */
define("app/core/collections/Activity_finsupports",function() {
	var Activity_finsupports = Backbone.Collection.extend({
			url: '/activity_finsupports/',
			model: models.Activity_finsupport
		});

	exports.Activity_finsupports = Activity_finsupports;
});

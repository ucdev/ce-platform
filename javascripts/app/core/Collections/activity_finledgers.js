/*! app/core/collections/Activity_finledgers */
define("app/core/collections/Activity_finledgers",function() {
	var Activity_finledgers = Backbone.Collection.extend({
			url: '/activity_finledgers/',
			model: models.Activity_finledger
		});

	exports.Activity_finledgers = Activity_finledgers;
});

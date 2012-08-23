/*! app/core/collections/Activity_specialtylms */
define("app/core/collections/Activity_specialtylms",function() {
	var Activity_specialtylms = Backbone.Collection.extend({
			url: '/activity_specialtylms/',
			model: models.Activity_specialtylm
		});

	exports.Activity_specialtylms = Activity_specialtylms;
});

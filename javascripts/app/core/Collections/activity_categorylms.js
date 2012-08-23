/*! app/core/collections/Activity_categorylms */
define("app/core/collections/Activity_categorylms",function() {
	var Activity_categorylms = Backbone.Collection.extend({
			url: '/activity_categorylms/',
			model: models.Activity_categorylm
		});

	exports.Activity_categorylms = Activity_categorylms;
});

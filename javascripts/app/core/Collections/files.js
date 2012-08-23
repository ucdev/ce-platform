/*! app/core/collections/Files */
define("app/core/collections/Files",function() {
	var Files = Backbone.Collection.extend({
			url: '/files/',
			model: models.File
		});

	exports.Files = Files;
});

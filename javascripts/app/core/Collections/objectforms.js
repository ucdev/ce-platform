/*! app/core/collections/Objectforms */
define("app/core/collections/Objectforms",function() {
	var Objectforms = Backbone.Collection.extend({
			url: '/objectforms/',
			model: models.Objectform
		});

	exports.Objectforms = Objectforms;
});

/*! app/core/collections/Processsteps */
define("app/core/collections/Processsteps",function() {
	var Processsteps = Backbone.Collection.extend({
			url: '/processsteps/',
			model: models.Processstep
		});

	exports.Processsteps = Processsteps;
});

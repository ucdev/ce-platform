/*! app/core/collections/Processmanagers */
define("app/core/collections/Processmanagers",function() {
	var Processmanagers = Backbone.Collection.extend({
			url: '/processmanagers/',
			model: models.Processmanager
		});

	exports.Processmanagers = Processmanagers;
});

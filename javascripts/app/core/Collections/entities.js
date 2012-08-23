/*! app/core/collections/Entities */
define("app/core/collections/Entities",function() {
	var Entities = Backbone.Collection.extend({
			url: '/entities/',
			model: models.Entity
		});

	exports.Entities = Entities;
});

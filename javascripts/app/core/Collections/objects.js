/*! app/core/collections/Objects */
define("app/core/collections/Objects",function() {
	var Objects = Backbone.Collection.extend({
			url: '/objects/',
			model: models.Object
		});

	exports.Objects = Objects;
});

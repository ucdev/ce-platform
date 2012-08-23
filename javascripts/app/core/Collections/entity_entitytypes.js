/*! app/core/collections/Entity_entitytypes */
define("app/core/collections/Entity_entitytypes",function() {
	var Entity_entitytypes = Backbone.Collection.extend({
			url: '/entity_entitytypes/',
			model: models.Entity_entitytype
		});

	exports.Entity_entitytypes = Entity_entitytypes;
});

/*! app/core/collections/Entity_entityroles */
define("app/core/collections/Entity_entityroles",function() {
	var Entity_entityroles = Backbone.Collection.extend({
			url: '/entity_entityroles/',
			model: models.Entity_entityrole
		});

	exports.Entity_entityroles = Entity_entityroles;
});

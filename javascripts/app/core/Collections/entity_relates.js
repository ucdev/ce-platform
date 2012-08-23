/*! app/core/collections/Entity_relates */
define("app/core/collections/Entity_relates",function() {
	var Entity_relates = Backbone.Collection.extend({
			url: '/entity_relates/',
			model: models.Entity_relate
		});

	exports.Entity_relates = Entity_relates;
});

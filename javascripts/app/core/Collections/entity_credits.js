/*! app/core/collections/Entity_credits */
define("app/core/collections/Entity_credits",function() {
	var Entity_credits = Backbone.Collection.extend({
			url: '/entity_credits/',
			model: models.Entity_credit
		});

	exports.Entity_credits = Entity_credits;
});

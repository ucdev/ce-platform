/*! app/core/collections/Entity_persons */
define("app/core/collections/Entity_persons",function() {
	var Entity_persons = Backbone.Collection.extend({
			url: '/entity_persons/',
			model: models.Entity_person
		});

	exports.Entity_persons = Entity_persons;
});

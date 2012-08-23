/*! app/core/collections/Process_persons */
define("app/core/collections/Process_persons",function() {
	var Process_persons = Backbone.Collection.extend({
			url: '/process_persons/',
			model: models.Process_person
		});

	exports.Process_persons = Process_persons;
});

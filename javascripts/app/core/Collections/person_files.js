/*! app/core/collections/Person_files */
define("app/core/collections/Person_files",function() {
	var Person_files = Backbone.Collection.extend({
			url: '/person_files/',
			model: models.Person_file
		});

	exports.Person_files = Person_files;
});

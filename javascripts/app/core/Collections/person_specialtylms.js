/*! app/core/collections/Person_specialtylms */
define("app/core/collections/Person_specialtylms",function() {
	var Person_specialtylms = Backbone.Collection.extend({
			url: '/person_specialtylms/',
			model: models.Person_specialtylm
		});

	exports.Person_specialtylms = Person_specialtylms;
});

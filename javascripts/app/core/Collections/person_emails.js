/*! app/core/collections/Person_emails */
define("app/core/collections/Person_emails",function() {
	var Person_emails = Backbone.Collection.extend({
			url: '/person_emails/',
			model: models.Person_email
		});

	exports.Person_emails = Person_emails;
});

/*! app/core/collections/Person_users */
define("app/core/collections/Person_users",function() {
	var Person_users = Backbone.Collection.extend({
			url: '/person_users/',
			model: models.Person_user
		});

	exports.Person_users = Person_users;
});

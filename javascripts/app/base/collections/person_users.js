/*! app/collections/person_users
* 	@requires: app,app/collection,app/models/person_user
* 	@extends: app.Collection
* 	@exports: app.collections.Person_users
*/
define("app/collections/person_users",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Person_userModel = require("app/models/person_user");
	
	Person_users = AppCollection.extend({
		url: '/person_users/',
		model: Person_userModel
	});

	module.setExports(Person_users);
});

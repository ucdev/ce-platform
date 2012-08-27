/*! app/collections/person_users
* 	@requires: app,app/models/person_user
* 	@extends: app.Collection
* 	@exports: app.collections.Person_users
*/
define("app/collections/person_users",["require","app","app/models"],function(require,app) {
	var Person_userModel = require("app/models/person_user");

	var Person_users = app.Collection.extend({
		url: '/person_users/',
		model: Person_userModel
	});

	module.setExports(Person_users);
});

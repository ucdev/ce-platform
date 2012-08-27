/*! app/collections/person_users
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Person_users
*/
define("app/collections/person_users",function(require,app) {
	var Person_userModel = require("app/models/person_user");

	app.collections.Person_users = app.Collection.extend({
		url: '/person_users/',
		model: Person_userModel
	});

	exports.app = app;
});

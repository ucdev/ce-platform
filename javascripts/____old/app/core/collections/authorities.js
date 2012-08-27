/*! app/collections/authorities
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Authorities
*/
define("app/collections/authorities",function(require,app) {
	var AuthorityModel = require("app/models/authority");

	app.collections.Authorities = app.Collection.extend({
		url: '/authorities/',
		model: AuthorityModel
	});

	exports.app = app;
});

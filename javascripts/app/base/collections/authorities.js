/*! app/collections/authorities
* 	@requires: app,app/collection,app/models/authority
* 	@extends: app.Collection
* 	@exports: app.collections.Authorities
*/
define("app/collections/authorities",["require"],function(require) {
	var AppCollection = require("app/collection");
	var AuthorityModel = require("app/models/authority");
	
	Authorities = AppCollection.extend({
		url: '/authorities/',
		model: AuthorityModel
	});

	module.setExports(Authorities);
});

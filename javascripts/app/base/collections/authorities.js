/*! app/collections/authorities
* 	@requires: app,app/models/authority
* 	@extends: app.Collection
* 	@exports: app.collections.Authorities
*/
define("app/collections/authorities",["require","app","app/models"],function(require,app) {
	var AuthorityModel = require("app/models/authority");

	var Authorities = app.Collection.extend({
		url: '/authorities/',
		model: AuthorityModel
	});

	module.setExports(Authorities);
});

/*! app/collections/authoritypages
* 	@requires: app,app/collection,app/models/authoritypage
* 	@extends: app.Collection
* 	@exports: app.collections.Authoritypages
*/
define("app/collections/authoritypages",["require"],function(require) {
	var AppCollection = require("app/collection");
	var AuthoritypageModel = require("app/models/authoritypage");
	
	Authoritypages = AppCollection.extend({
		url: '/authoritypages/',
		model: AuthoritypageModel
	});

	module.setExports(Authoritypages);
});

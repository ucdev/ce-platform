/*! app/collections/authoritypages
* 	@requires: app,app/models/authoritypage
* 	@extends: app.Collection
* 	@exports: app.collections.Authoritypages
*/
define("app/collections/authoritypages",["require","app","app/models"],function(require,app) {
	var AuthoritypageModel = require("app/models/authoritypage");

	var Authoritypages = app.Collection.extend({
		url: '/authoritypages/',
		model: AuthoritypageModel
	});

	module.setExports(Authoritypages);
});

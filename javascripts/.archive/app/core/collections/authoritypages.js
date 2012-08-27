/*! app/collections/authoritypages
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Authoritypages
*/
define("app/collections/authoritypages",function(require,app) {
	var AuthoritypageModel = require("app/models/authoritypage");

	app.collections.Authoritypages = app.Collection.extend({
		url: '/authoritypages/',
		model: AuthoritypageModel
	});

	exports.app = app;
});

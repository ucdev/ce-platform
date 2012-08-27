/*! app/collections/accounts
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Accounts
*/
define("app/collections/accounts",function(require,app) {
	var AccountModel = require("app/models/account");

	app.collections.Accounts = app.Collection.extend({
		url: '/accounts/',
		model: AccountModel
	});

	exports.app = app;
});

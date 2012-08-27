/*! app/collections/accounts
* 	@requires: app,app/models/account
* 	@extends: app.Collection
* 	@exports: app.collections.Accounts
*/
define("app/collections/accounts",["require","app","app/models"],function(require,app) {
	var AccountModel = require("app/models/account");

	var Accounts = app.Collection.extend({
		url: '/accounts/',
		model: AccountModel
	});

	module.setExports(Accounts);
});

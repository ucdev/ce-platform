/*! app/collections/accounts
* 	@requires: app,app/collection,app/models/account
* 	@extends: app.Collection
* 	@exports: app.collections.Accounts
*/
define("app/collections/accounts",["require"],function(require) {
	var AppCollection = require("app/collection");
	var AccountModel = require("app/models/account");
	
	Accounts = AppCollection.extend({
		url: '/accounts/',
		model: AccountModel
	});

	module.setExports(Accounts);
});

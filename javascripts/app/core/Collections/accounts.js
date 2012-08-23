/*! app/core/collections/Accounts */
define("app/core/collections/Accounts",function() {
	var Accounts = Backbone.Collection.extend({
			url: '/accounts/',
			model: models.Account
		});

	exports.Accounts = Accounts;
});

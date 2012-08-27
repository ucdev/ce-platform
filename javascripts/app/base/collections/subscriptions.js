/*! app/collections/subscriptions
* 	@requires: app,app/models/subscription
* 	@extends: app.Collection
* 	@exports: app.collections.Subscriptions
*/
define("app/collections/subscriptions",["require","app","app/models"],function(require,app) {
	var SubscriptionModel = require("app/models/subscription");

	var Subscriptions = app.Collection.extend({
		url: '/subscriptions/',
		model: SubscriptionModel
	});

	module.setExports(Subscriptions);
});

/*! app/collections/subscriptions
* 	@requires: app,app/collection,app/models/subscription
* 	@extends: app.Collection
* 	@exports: app.collections.Subscriptions
*/
define("app/collections/subscriptions",["require"],function(require) {
	var AppCollection = require("app/collection");
	var SubscriptionModel = require("app/models/subscription");
	
	Subscriptions = AppCollection.extend({
		url: '/subscriptions/',
		model: SubscriptionModel
	});

	module.setExports(Subscriptions);
});

/*! app/collections/subscriptions
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Subscriptions
*/
define("app/collections/subscriptions",function(require,app) {
	var SubscriptionModel = require("app/models/subscription");

	app.collections.Subscriptions = app.Collection.extend({
		url: '/subscriptions/',
		model: SubscriptionModel
	});

	exports.app = app;
});

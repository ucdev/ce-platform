/*! app/core/collections/Subscriptions */
define("app/core/collections/Subscriptions",function() {
	var Subscriptions = Backbone.Collection.extend({
			url: '/subscriptions/',
			model: models.Subscription
		});

	exports.Subscriptions = Subscriptions;
});

/*! app/core/collections/Credit_requests */
define("app/core/collections/Credit_requests",function() {
	var Credit_requests = Backbone.Collection.extend({
			url: '/credit_requests/',
			model: models.Credit_request
		});

	exports.Credit_requests = Credit_requests;
});

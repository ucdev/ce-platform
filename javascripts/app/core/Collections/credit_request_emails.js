/*! app/core/collections/Credit_request_emails */
define("app/core/collections/Credit_request_emails",function() {
	var Credit_request_emails = Backbone.Collection.extend({
			url: '/credit_request_emails/',
			model: models.Credit_request_email
		});

	exports.Credit_request_emails = Credit_request_emails;
});

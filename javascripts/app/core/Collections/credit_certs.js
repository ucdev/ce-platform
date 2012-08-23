/*! app/core/collections/Credit_certs */
define("app/core/collections/Credit_certs",function() {
	var Credit_certs = Backbone.Collection.extend({
			url: '/credit_certs/',
			model: models.Credit_cert
		});

	exports.Credit_certs = Credit_certs;
});

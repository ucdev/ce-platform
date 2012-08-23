/*! app/core/collections/Cert_credits */
define("app/core/collections/Cert_credits",function() {
	var Cert_credits = Backbone.Collection.extend({
			url: '/cert_credits/',
			model: models.Cert_credit
		});

	exports.Cert_credits = Cert_credits;
});

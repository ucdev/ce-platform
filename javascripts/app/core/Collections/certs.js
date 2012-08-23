/*! app/core/collections/Certs */
define("app/core/collections/Certs",function() {
	var Certs = Backbone.Collection.extend({
			url: '/certs/',
			model: models.Cert
		});

	exports.Certs = Certs;
});

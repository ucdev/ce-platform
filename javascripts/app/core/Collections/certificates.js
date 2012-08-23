/*! app/core/collections/Certificates */
define("app/core/collections/Certificates",function() {
	var Certificates = Backbone.Collection.extend({
			url: '/certificates/',
			model: models.Certificate
		});

	exports.Certificates = Certificates;
});

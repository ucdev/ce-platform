/*! app/core/collections/Authorities */
define("app/core/collections/Authorities",function() {
	var Authorities = Backbone.Collection.extend({
			url: '/authorities/',
			model: models.Authority
		});

	exports.Authorities = Authorities;
});

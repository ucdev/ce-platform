/*! app/core/collections/Authoritypages */
define("app/core/collections/Authoritypages",function() {
	var Authoritypages = Backbone.Collection.extend({
			url: '/authoritypages/',
			model: models.Authoritypage
		});

	exports.Authoritypages = Authoritypages;
});

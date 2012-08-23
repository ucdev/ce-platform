/*! app/core/collections/Grouptypes */
define("app/core/collections/Grouptypes",function() {
	var Grouptypes = Backbone.Collection.extend({
			url: '/grouptypes/',
			model: models.Grouptype
		});

	exports.Grouptypes = Grouptypes;
});

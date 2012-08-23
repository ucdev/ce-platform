/*! app/core/collections/Locationtypes */
define("app/core/collections/Locationtypes",function() {
	var Locationtypes = Backbone.Collection.extend({
			url: '/locationtypes/',
			model: models.Locationtype
		});

	exports.Locationtypes = Locationtypes;
});

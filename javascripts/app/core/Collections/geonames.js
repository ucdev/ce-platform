/*! app/core/collections/Geonames */
define("app/core/collections/Geonames",function() {
	var Geonames = Backbone.Collection.extend({
			url: '/geonames/',
			model: models.Geoname
		});

	exports.Geonames = Geonames;
});

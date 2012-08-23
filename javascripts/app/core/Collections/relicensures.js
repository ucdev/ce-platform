/*! app/core/collections/Relicensures */
define("app/core/collections/Relicensures",function() {
	var Relicensures = Backbone.Collection.extend({
			url: '/relicensures/',
			model: models.Relicensure
		});

	exports.Relicensures = Relicensures;
});

/*! app/core/collections/Assesssections */
define("app/core/collections/Assesssections",function() {
	var Assesssections = Backbone.Collection.extend({
			url: '/assesssections/',
			model: models.Assesssection
		});

	exports.Assesssections = Assesssections;
});

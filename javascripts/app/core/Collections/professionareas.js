/*! app/core/collections/Professionareas */
define("app/core/collections/Professionareas",function() {
	var Professionareas = Backbone.Collection.extend({
			url: '/professionareas/',
			model: models.Professionarea
		});

	exports.Professionareas = Professionareas;
});

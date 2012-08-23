/*! app/core/collections/Objectfields */
define("app/core/collections/Objectfields",function() {
	var Objectfields = Backbone.Collection.extend({
			url: '/objectfields/',
			model: models.Objectfield
		});

	exports.Objectfields = Objectfields;
});

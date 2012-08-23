/*! app/core/collections/Objectdatas */
define("app/core/collections/Objectdatas",function() {
	var Objectdatas = Backbone.Collection.extend({
			url: '/objectdatas/',
			model: models.Objectdatum
		});

	exports.Objectdatas = Objectdatas;
});

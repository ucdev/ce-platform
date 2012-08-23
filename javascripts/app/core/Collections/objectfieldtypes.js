/*! app/core/collections/Objectfieldtypes */
define("app/core/collections/Objectfieldtypes",function() {
	var Objectfieldtypes = Backbone.Collection.extend({
			url: '/objectfieldtypes/',
			model: models.Objectfieldtype
		});

	exports.Objectfieldtypes = Objectfieldtypes;
});

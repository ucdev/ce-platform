/*! app/core/collections/Entitytypes */
define("app/core/collections/Entitytypes",function() {
	var Entitytypes = Backbone.Collection.extend({
			url: '/entitytypes/',
			model: models.Entitytype
		});

	exports.Entitytypes = Entitytypes;
});

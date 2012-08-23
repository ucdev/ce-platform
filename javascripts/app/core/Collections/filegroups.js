/*! app/core/collections/Filegroups */
define("app/core/collections/Filegroups",function() {
	var Filegroups = Backbone.Collection.extend({
			url: '/filegroups/',
			model: models.Filegroup
		});

	exports.Filegroups = Filegroups;
});

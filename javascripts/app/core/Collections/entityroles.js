/*! app/core/collections/Entityroles */
define("app/core/collections/Entityroles",function() {
	var Entityroles = Backbone.Collection.extend({
			url: '/entityroles/',
			model: models.Entityrole
		});

	exports.Entityroles = Entityroles;
});

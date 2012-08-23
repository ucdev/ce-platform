/*! app/core/collections/Groups */
define("app/core/collections/Groups",function() {
	var Groups = Backbone.Collection.extend({
			url: '/groups/',
			model: models.Group
		});

	exports.Groups = Groups;
});

/*! app/core/collections/Actions */
define("app/core/collections/Actions",function() {
	var Actions = Backbone.Collection.extend({
			url: '/actions/',
			model: models.Action
		});

	exports.Actions = Actions;
});

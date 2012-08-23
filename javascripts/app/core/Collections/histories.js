/*! app/core/collections/Histories */
define("app/core/collections/Histories",function() {
	var Histories = Backbone.Collection.extend({
			url: '/histories/',
			model: models.History
		});

	exports.Histories = Histories;
});

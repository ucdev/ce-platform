/*! app/core/collections/Assessanswers */
define("app/core/collections/Assessanswers",function() {
	var Assessanswers = Backbone.Collection.extend({
			url: '/assessanswers/',
			model: models.Assessanswer
		});

	exports.Assessanswers = Assessanswers;
});

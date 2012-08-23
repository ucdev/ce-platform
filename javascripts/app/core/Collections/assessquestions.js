/*! app/core/collections/Assessquestions */
define("app/core/collections/Assessquestions",function() {
	var Assessquestions = Backbone.Collection.extend({
			url: '/assessquestions/',
			model: models.Assessquestion
		});

	exports.Assessquestions = Assessquestions;
});

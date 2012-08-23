/*! app/core/collections/Assessments */
define("app/core/collections/Assessments",function() {
	var Assessments = Backbone.Collection.extend({
			url: '/assessments/',
			model: models.Assessment
		});

	exports.Assessments = Assessments;
});

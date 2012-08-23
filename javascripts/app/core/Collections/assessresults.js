/*! app/core/collections/Assessresults */
define("app/core/collections/Assessresults",function() {
	var Assessresults = Backbone.Collection.extend({
			url: '/assessresults/',
			model: models.Assessresult
		});

	exports.Assessresults = Assessresults;
});

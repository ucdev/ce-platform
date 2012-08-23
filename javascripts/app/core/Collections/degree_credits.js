/*! app/core/collections/Degree_credits */
define("app/core/collections/Degree_credits",function() {
	var Degree_credits = Backbone.Collection.extend({
			url: '/degree_credits/',
			model: models.Degree_credit
		});

	exports.Degree_credits = Degree_credits;
});

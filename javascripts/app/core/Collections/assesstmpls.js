/*! app/core/collections/Assesstmpls */
define("app/core/collections/Assesstmpls",function() {
	var Assesstmpls = Backbone.Collection.extend({
			url: '/assesstmpls/',
			model: models.Assesstmpl
		});

	exports.Assesstmpls = Assesstmpls;
});

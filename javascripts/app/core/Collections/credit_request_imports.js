/*! app/core/collections/Credit_request_imports */
define("app/core/collections/Credit_request_imports",function() {
	var Credit_request_imports = Backbone.Collection.extend({
			url: '/credit_request_imports/',
			model: models.Credit_request_import
		});

	exports.Credit_request_imports = Credit_request_imports;
});

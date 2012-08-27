/*! app/collections/degree_credits
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Degree_credits
*/
define("app/collections/degree_credits",function(require,app) {
	var Degree_creditModel = require("app/models/degree_credit");

	app.collections.Degree_credits = app.Collection.extend({
		url: '/degree_credits/',
		model: Degree_creditModel
	});

	exports.app = app;
});

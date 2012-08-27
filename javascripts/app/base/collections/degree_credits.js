/*! app/collections/degree_credits
* 	@requires: app,app/models/degree_credit
* 	@extends: app.Collection
* 	@exports: app.collections.Degree_credits
*/
define("app/collections/degree_credits",["require","app","app/models"],function(require,app) {
	var Degree_creditModel = require("app/models/degree_credit");

	var Degree_credits = app.Collection.extend({
		url: '/degree_credits/',
		model: Degree_creditModel
	});

	module.setExports(Degree_credits);
});

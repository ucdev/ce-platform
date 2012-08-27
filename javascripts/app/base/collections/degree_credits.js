/*! app/collections/degree_credits
* 	@requires: app,app/collection,app/models/degree_credit
* 	@extends: app.Collection
* 	@exports: app.collections.Degree_credits
*/
define("app/collections/degree_credits",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Degree_creditModel = require("app/models/degree_credit");
	
	Degree_credits = AppCollection.extend({
		url: '/degree_credits/',
		model: Degree_creditModel
	});

	module.setExports(Degree_credits);
});

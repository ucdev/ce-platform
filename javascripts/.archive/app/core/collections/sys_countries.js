/*! app/collections/sys_countries
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_countries
*/
define("app/collections/sys_countries",function(require,app) {
	var Sys_countryModel = require("app/models/sys_country");

	app.collections.Sys_countries = app.Collection.extend({
		url: '/sys_countries/',
		model: Sys_countryModel
	});

	exports.app = app;
});

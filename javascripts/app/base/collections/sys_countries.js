/*! app/collections/sys_countries
* 	@requires: app,app/models/sys_country
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_countries
*/
define("app/collections/sys_countries",["require","app","app/models"],function(require,app) {
	var Sys_countryModel = require("app/models/sys_country");

	var Sys_countries = app.Collection.extend({
		url: '/sys_countries/',
		model: Sys_countryModel
	});

	module.setExports(Sys_countries);
});

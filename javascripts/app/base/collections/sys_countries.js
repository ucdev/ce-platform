/*! app/collections/sys_countries
* 	@requires: app,app/collection,app/models/sys_country
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_countries
*/
define("app/collections/sys_countries",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_countryModel = require("app/models/sys_country");
	
	Sys_countries = AppCollection.extend({
		url: '/sys_countries/',
		model: Sys_countryModel
	});

	module.setExports(Sys_countries);
});

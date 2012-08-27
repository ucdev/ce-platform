/*! app/collections/geonames
* 	@requires: app,app/models/geoname
* 	@extends: app.Collection
* 	@exports: app.collections.Geonames
*/
define("app/collections/geonames",["require","app","app/models"],function(require,app) {
	var GeonameModel = require("app/models/geoname");

	var Geonames = app.Collection.extend({
		url: '/geonames/',
		model: GeonameModel
	});

	module.setExports(Geonames);
});

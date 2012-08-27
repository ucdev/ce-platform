/*! app/collections/geonames
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Geonames
*/
define("app/collections/geonames",function(require,app) {
	var GeonameModel = require("app/models/geoname");

	app.collections.Geonames = app.Collection.extend({
		url: '/geonames/',
		model: GeonameModel
	});

	exports.app = app;
});

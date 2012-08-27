/*! app/collections/relicensures
* 	@requires: app,app/models/relicensure
* 	@extends: app.Collection
* 	@exports: app.collections.Relicensures
*/
define("app/collections/relicensures",["require","app","app/models"],function(require,app) {
	var RelicensureModel = require("app/models/relicensure");

	var Relicensures = app.Collection.extend({
		url: '/relicensures/',
		model: RelicensureModel
	});

	module.setExports(Relicensures);
});

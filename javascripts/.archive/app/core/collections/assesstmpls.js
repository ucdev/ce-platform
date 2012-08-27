/*! app/collections/assesstmpls
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Assesstmpls
*/
define("app/collections/assesstmpls",function(require,app) {
	var AssesstmplModel = require("app/models/assesstmpl");

	app.collections.Assesstmpls = app.Collection.extend({
		url: '/assesstmpls/',
		model: AssesstmplModel
	});

	exports.app = app;
});

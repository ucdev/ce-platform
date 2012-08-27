/*! app/collections/assesstmpls
* 	@requires: app,app/models/assesstmpl
* 	@extends: app.Collection
* 	@exports: app.collections.Assesstmpls
*/
define("app/collections/assesstmpls",["require","app","app/models"],function(require,app) {
	var AssesstmplModel = require("app/models/assesstmpl");

	var Assesstmpls = app.Collection.extend({
		url: '/assesstmpls/',
		model: AssesstmplModel
	});

	module.setExports(Assesstmpls);
});

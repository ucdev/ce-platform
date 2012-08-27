/*! app/collections/assesstmpls
* 	@requires: app,app/collection,app/models/assesstmpl
* 	@extends: app.Collection
* 	@exports: app.collections.Assesstmpls
*/
define("app/collections/assesstmpls",["require"],function(require) {
	var AppCollection = require("app/collection");
	var AssesstmplModel = require("app/models/assesstmpl");
	
	Assesstmpls = AppCollection.extend({
		url: '/assesstmpls/',
		model: AssesstmplModel
	});

	module.setExports(Assesstmpls);
});

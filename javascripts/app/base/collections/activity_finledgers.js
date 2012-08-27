/*! app/collections/activity_finledgers
* 	@requires: app,app/collection,app/models/activity_finledger
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_finledgers
*/
define("app/collections/activity_finledgers",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Activity_finledgerModel = require("app/models/activity_finledger");
	
	Activity_finledgers = AppCollection.extend({
		url: '/activity_finledgers/',
		model: Activity_finledgerModel
	});

	module.setExports(Activity_finledgers);
});

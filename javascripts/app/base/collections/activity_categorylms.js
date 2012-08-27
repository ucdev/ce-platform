/*! app/collections/activity_categorylms
* 	@requires: app,app/collection,app/models/activity_categorylm
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_categorylms
*/
define("app/collections/activity_categorylms",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Activity_categorylmModel = require("app/models/activity_categorylm");
	
	Activity_categorylms = AppCollection.extend({
		url: '/activity_categorylms/',
		model: Activity_categorylmModel
	});

	module.setExports(Activity_categorylms);
});

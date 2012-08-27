/*! app/collections/activity_categorylms
* 	@requires: app,app/models/activity_categorylm
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_categorylms
*/
define("app/collections/activity_categorylms",["require","app","app/models"],function(require,app) {
	var Activity_categorylmModel = require("app/models/activity_categorylm");

	var Activity_categorylms = app.Collection.extend({
		url: '/activity_categorylms/',
		model: Activity_categorylmModel
	});

	module.setExports(Activity_categorylms);
});

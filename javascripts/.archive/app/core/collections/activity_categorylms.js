/*! app/collections/activity_categorylms
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_categorylms
*/
define("app/collections/activity_categorylms",function(require,app) {
	var Activity_categorylmModel = require("app/models/activity_categorylm");

	app.collections.Activity_categorylms = app.Collection.extend({
		url: '/activity_categorylms/',
		model: Activity_categorylmModel
	});

	exports.app = app;
});

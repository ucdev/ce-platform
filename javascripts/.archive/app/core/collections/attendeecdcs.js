/*! app/collections/attendeecdcs
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Attendeecdcs
*/
define("app/collections/attendeecdcs",function(require,app) {
	var AttendeecdcModel = require("app/models/attendeecdc");

	app.collections.Attendeecdcs = app.Collection.extend({
		url: '/attendeecdcs/',
		model: AttendeecdcModel
	});

	exports.app = app;
});

/*! app/collections/attendeecredits
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Attendeecredits
*/
define("app/collections/attendeecredits",function(require,app) {
	var AttendeecreditModel = require("app/models/attendeecredit");

	app.collections.Attendeecredits = app.Collection.extend({
		url: '/attendeecredits/',
		model: AttendeecreditModel
	});

	exports.app = app;
});

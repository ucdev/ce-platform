/*! app/collections/attendeecdcs
* 	@requires: app,app/models/attendeecdc
* 	@extends: app.Collection
* 	@exports: app.collections.Attendeecdcs
*/
define("app/collections/attendeecdcs",["require","app","app/models"],function(require,app) {
	var AttendeecdcModel = require("app/models/attendeecdc");

	var Attendeecdcs = app.Collection.extend({
		url: '/attendeecdcs/',
		model: AttendeecdcModel
	});

	module.setExports(Attendeecdcs);
});

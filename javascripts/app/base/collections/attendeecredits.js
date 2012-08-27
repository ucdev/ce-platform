/*! app/collections/attendeecredits
* 	@requires: app,app/models/attendeecredit
* 	@extends: app.Collection
* 	@exports: app.collections.Attendeecredits
*/
define("app/collections/attendeecredits",["require","app","app/models"],function(require,app) {
	var AttendeecreditModel = require("app/models/attendeecredit");

	var Attendeecredits = app.Collection.extend({
		url: '/attendeecredits/',
		model: AttendeecreditModel
	});

	module.setExports(Attendeecredits);
});

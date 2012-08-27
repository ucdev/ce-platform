/*! app/collections/attendeecredits
* 	@requires: app,app/collection,app/models/attendeecredit
* 	@extends: app.Collection
* 	@exports: app.collections.Attendeecredits
*/
define("app/collections/attendeecredits",["require"],function(require) {
	var AppCollection = require("app/collection");
	var AttendeecreditModel = require("app/models/attendeecredit");
	
	Attendeecredits = AppCollection.extend({
		url: '/attendeecredits/',
		model: AttendeecreditModel
	});

	module.setExports(Attendeecredits);
});

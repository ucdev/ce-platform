/*! app/collections/sys_states
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_states
*/
define("app/collections/sys_states",function(require,app) {
	var Sys_stateModel = require("app/models/sys_state");

	app.collections.Sys_states = app.Collection.extend({
		url: '/sys_states/',
		model: Sys_stateModel
	});

	exports.app = app;
});

/*! app/collections/sys_states
* 	@requires: app,app/models/sys_state
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_states
*/
define("app/collections/sys_states",["require","app","app/models"],function(require,app) {
	var Sys_stateModel = require("app/models/sys_state");

	var Sys_states = app.Collection.extend({
		url: '/sys_states/',
		model: Sys_stateModel
	});

	module.setExports(Sys_states);
});

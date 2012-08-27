/*! app/collections/sys_states
* 	@requires: app,app/collection,app/models/sys_state
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_states
*/
define("app/collections/sys_states",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_stateModel = require("app/models/sys_state");
	
	Sys_states = AppCollection.extend({
		url: '/sys_states/',
		model: Sys_stateModel
	});

	module.setExports(Sys_states);
});

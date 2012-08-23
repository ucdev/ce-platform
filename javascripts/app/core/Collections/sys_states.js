/*! app/core/collections/Sys_states */
define("app/core/collections/Sys_states",function() {
	var Sys_states = Backbone.Collection.extend({
			url: '/sys_states/',
			model: models.Sys_state
		});

	exports.Sys_states = Sys_states;
});

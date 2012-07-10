(function() {
	'use strict';

	// Todo Router
	// ----------

	var Workspace = Backbone.Router.extend({
		
		routes:{
			"*filter": "setFilter"
		},

		setFilter: function(param){
/*
			// Set the current filter to be used
			window.ccpd.TodoFilter = param.trim() || "";

			// Trigger a collection reset/addAll
			window.ccpd.Todos.trigger('reset');*/
		}

	});

	/*window.app.TodoRouter = new Workspace;*/
	/*Backbone.history.start();*/

})();
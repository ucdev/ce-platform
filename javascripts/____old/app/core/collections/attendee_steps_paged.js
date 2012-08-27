/*! app/collections/attendee_steps_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Attendee_steps_paged
*/
define("app/collections/Attendee_steps_paged",function(require,app) {
	var Attendee_stepModel = require("app/models/attendee_step");

	app.collections.Attendee_steps_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/attendee_steps/'
		    },
		    paginator_ui: {
		      firstPage: 1,
		      currentPage: 1,
		      perPage: 15
		    },
		    parse: function(response) {
		      this.totalPages = Math.ceil(response.length / this.perPage);
		      return response;
		    },
		    model: Attendee_stepModel
		});

	exports.app = app;
});

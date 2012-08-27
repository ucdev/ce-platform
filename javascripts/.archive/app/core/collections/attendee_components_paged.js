/*! app/collections/attendee_components_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Attendee_components_paged
*/
define("app/collections/Attendee_components_paged",function(require,app) {
	var Attendee_componentModel = require("app/models/attendee_component");

	app.collections.Attendee_components_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/attendee_components/'
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
		    model: Attendee_componentModel
		});

	exports.app = app;
});

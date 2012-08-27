/*! app/collections/attendeecdcs_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Attendeecdcs_paged
*/
define("app/collections/Attendeecdcs_paged",function(require,app) {
	var AttendeecdcModel = require("app/models/attendeecdc");

	app.collections.Attendeecdcs_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/attendeecdcs/'
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
		    model: AttendeecdcModel
		});

	exports.app = app;
});

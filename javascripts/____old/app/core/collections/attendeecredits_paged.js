/*! app/collections/attendeecredits_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Attendeecredits_paged
*/
define("app/collections/Attendeecredits_paged",function(require,app) {
	var AttendeecreditModel = require("app/models/attendeecredit");

	app.collections.Attendeecredits_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/attendeecredits/'
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
		    model: AttendeecreditModel
		});

	exports.app = app;
});

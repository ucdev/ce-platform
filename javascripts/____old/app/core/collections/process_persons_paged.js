/*! app/collections/process_persons_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Process_persons_paged
*/
define("app/collections/Process_persons_paged",function(require,app) {
	var Process_personModel = require("app/models/process_person");

	app.collections.Process_persons_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/process_persons/'
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
		    model: Process_personModel
		});

	exports.app = app;
});

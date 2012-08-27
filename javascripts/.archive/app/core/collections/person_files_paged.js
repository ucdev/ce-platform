/*! app/collections/person_files_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Person_files_paged
*/
define("app/collections/Person_files_paged",function(require,app) {
	var Person_fileModel = require("app/models/person_file");

	app.collections.Person_files_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/person_files/'
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
		    model: Person_fileModel
		});

	exports.app = app;
});

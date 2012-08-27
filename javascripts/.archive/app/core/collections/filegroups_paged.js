/*! app/collections/filegroups_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Filegroups_paged
*/
define("app/collections/Filegroups_paged",function(require,app) {
	var FilegroupModel = require("app/models/filegroup");

	app.collections.Filegroups_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/filegroups/'
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
		    model: FilegroupModel
		});

	exports.app = app;
});

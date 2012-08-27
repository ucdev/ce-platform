/*! app/collections/activity_specialtylms_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Activity_specialtylms_paged
*/
define("app/collections/Activity_specialtylms_paged",function(require,app) {
	var Activity_specialtylmModel = require("app/models/activity_specialtylm");

	app.collections.Activity_specialtylms_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/activity_specialtylms/'
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
		    model: Activity_specialtylmModel
		});

	exports.app = app;
});

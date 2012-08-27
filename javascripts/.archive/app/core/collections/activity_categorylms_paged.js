/*! app/collections/activity_categorylms_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Activity_categorylms_paged
*/
define("app/collections/Activity_categorylms_paged",function(require,app) {
	var Activity_categorylmModel = require("app/models/activity_categorylm");

	app.collections.Activity_categorylms_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/activity_categorylms/'
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
		    model: Activity_categorylmModel
		});

	exports.app = app;
});

/*! app/collections/wheels_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Wheels_paged
*/
define("app/collections/Wheels_paged",function(require,app) {
	var WheelModel = require("app/models/wheel");

	app.collections.Wheels_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/wheels/'
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
		    model: WheelModel
		});

	exports.app = app;
});

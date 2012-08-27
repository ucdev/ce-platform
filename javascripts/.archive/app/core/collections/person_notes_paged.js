/*! app/collections/person_notes_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Person_notes_paged
*/
define("app/collections/Person_notes_paged",function(require,app) {
	var Person_noteModel = require("app/models/person_note");

	app.collections.Person_notes_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/person_notes/'
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
		    model: Person_noteModel
		});

	exports.app = app;
});

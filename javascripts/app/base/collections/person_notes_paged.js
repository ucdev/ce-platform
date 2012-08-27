/*! app/collections/person_notes_paged
*   @requires: app,app/models/person_note
*   @extends: app.Collection_paged
*   @exports: app.collections.Person_notes_paged
*/
define("app/collections/Person_notes_paged",["require","app","app/models"],function(require,app) {
  var Person_noteModel = require("app/models/person_note");

  var Person_notes_paged = app.Collection_paged.extend({
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

  module.setExports(Person_notes_paged);
});

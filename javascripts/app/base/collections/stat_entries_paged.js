/*! app/collections/stat_entries_paged
*   @requires: app,app/models/stat_entry
*   @extends: app.Collection_paged
*   @exports: app.collections.Stat_entries_paged
*/
define("app/collections/Stat_entries_paged",["require","app","app/models"],function(require,app) {
  var Stat_entryModel = require("app/models/stat_entry");

  var Stat_entries_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/stat_entries/'
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
          model: Stat_entryModel
      });

  module.setExports(Stat_entries_paged);
});

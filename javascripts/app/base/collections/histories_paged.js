/*! app/collections/histories_paged
*   @requires: app,app/models/history
*   @extends: app.Collection_paged
*   @exports: app.collections.Histories_paged
*/
define("app/collections/Histories_paged",["require","app","app/models"],function(require,app) {
  var HistoryModel = require("app/models/history");

  var Histories_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/histories/'
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
          model: HistoryModel
      });

  module.setExports(Histories_paged);
});

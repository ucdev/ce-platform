/*! app/collections/processes_paged
*   @requires: app,app/models/process
*   @extends: app.Collection_paged
*   @exports: app.collections.Processes_paged
*/
define("app/collections/Processes_paged",["require","app","app/models"],function(require,app) {
  var ProcessModel = require("app/models/process");

  var Processes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/processes/'
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
          model: ProcessModel
      });

  module.setExports(Processes_paged);
});

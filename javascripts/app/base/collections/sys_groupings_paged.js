/*! app/collections/sys_groupings_paged
*   @requires: app,app/models/sys_grouping
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_groupings_paged
*/
define("app/collections/Sys_groupings_paged",["require","app","app/models"],function(require,app) {
  var Sys_groupingModel = require("app/models/sys_grouping");

  var Sys_groupings_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_groupings/'
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
          model: Sys_groupingModel
      });

  module.setExports(Sys_groupings_paged);
});
